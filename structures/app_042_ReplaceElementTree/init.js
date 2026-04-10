const makeId = () => {
  return Math.random().toString(36).slice(2, 10)
}

const parseMaybeObject = (value, fieldName) => {
  if (typeof value !== 'string') return value

  const trimmed = value.trim()
  if (!trimmed) return value

  if (
    (trimmed.startsWith('{') && trimmed.endsWith('}')) ||
    (trimmed.startsWith('[') && trimmed.endsWith(']'))
  ) {
    try {
      return JSON.parse(trimmed)
    } catch (e) {
      throw new Error(`${fieldName} must be valid JSON when provided as a string`)
    }
  }

  return value
}

const getElementTree = () => {
  if (Array.isArray(Application?.pages)) return Application.pages
  throw new Error('Application.pages is not available. Make sure the application is fully loaded before running Replace Element Tree.')
}

const findNodeFlexible = (nodes, selector, parent = null) => {
  let matchByName = null
  let matchByValue = null

  for (const node of nodes || []) {
    if (node.unique_id === selector) return { node, parent }

    if (!matchByName && node.name === selector) {
      matchByName = { node, parent }
    }

    if (!matchByValue && node.value === selector) {
      matchByValue = { node, parent }
    }

    if (node.children && node.children.length) {
      const found = findNodeFlexible(node.children, selector, node)
      if (found) return found
    }
  }

  return matchByName || matchByValue || null
}

const cloneDeep = (obj) => JSON.parse(JSON.stringify(obj))

const ensureArray = (value, fieldName) => {
  if (typeof value === 'undefined' || value === null) return []
  if (!Array.isArray(value)) throw new Error(`${fieldName} must be an array`)
  return value
}

const collectIds = (node, bucket = []) => {
  if (!node || typeof node !== 'object') return bucket
  if (node.unique_id) bucket.push(node.unique_id)
  for (const child of node.children || []) collectIds(child, bucket)
  return bucket
}

const buildExistingIdSet = (nodes, bucket = new Set()) => {
  for (const node of nodes || []) {
    if (node && node.unique_id) bucket.add(node.unique_id)
    if (node && node.children && node.children.length) {
      buildExistingIdSet(node.children, bucket)
    }
  }
  return bucket
}

const generateUniqueId = (usedIds) => {
  let id = makeId()
  while (usedIds.has(id)) {
    id = makeId()
  }
  usedIds.add(id)
  return id
}

const normalizeTree = ({
  node,
  parentId,
  preserveRootUniqueId,
  forcedRootUniqueId,
  preserveDescendantUniqueIds,
  usedIds,
  depth = 0
}) => {
  if (!node || typeof node !== 'object' || Array.isArray(node)) {
    throw new Error('Tree must be a valid object')
  }

  const normalized = cloneDeep(node)

  if (normalized.type !== 'element') {
    throw new Error('Tree root and all descendants must be type "element"')
  }

  const originalChildren = ensureArray(normalized.children, 'children')

  if (depth === 0 && preserveRootUniqueId && forcedRootUniqueId) {
    normalized.unique_id = forcedRootUniqueId
    usedIds.add(forcedRootUniqueId)
  } else {
    const candidateId = normalized.unique_id

    if (
      candidateId &&
      (
        (depth === 0 && !preserveRootUniqueId) ||
        (depth > 0 && preserveDescendantUniqueIds)
      ) &&
      !usedIds.has(candidateId)
    ) {
      normalized.unique_id = candidateId
      usedIds.add(candidateId)
    } else {
      normalized.unique_id = generateUniqueId(usedIds)
    }
  }

  normalized.parent = parentId || null
  normalized.children = []

  for (let i = 0; i < originalChildren.length; i++) {
    const child = originalChildren[i]

    if (!child || typeof child !== 'object' || Array.isArray(child)) {
      throw new Error('Each child in Tree.children must be an object')
    }

    if (child.type !== 'element') {
      throw new Error('All descendants in Tree.children must be type "element"')
    }

    const normalizedChild = normalizeTree({
      node: child,
      parentId: normalized.unique_id,
      preserveRootUniqueId,
      forcedRootUniqueId: null,
      preserveDescendantUniqueIds,
      usedIds,
      depth: depth + 1
    })

    normalizedChild.childOrder = i + 1
    normalized.children.push(normalizedChild)
  }

  normalized.updatedAt = new Date().toISOString()
  return normalized
}

if (!Parameters.Element) {
  throw new Error('Replace Element Tree requires parameter: Element')
}

if (typeof Parameters.Tree === 'undefined') {
  throw new Error('Replace Element Tree requires parameter: Tree')
}

const parsedTree = parseMaybeObject(Parameters.Tree, 'Tree')

if (!parsedTree || typeof parsedTree !== 'object' || Array.isArray(parsedTree)) {
  throw new Error('Tree must be a valid object')
}

const elementTree = getElementTree()
const found = findNodeFlexible(elementTree, Parameters.Element)

if (!found || !found.node || found.node.type !== 'element') {
  throw new Error(`Element not found (by id, name, or value): ${Parameters.Element}`)
}

const target = found.node
const parent = found.parent

if (!parent || !Array.isArray(parent.children)) {
  throw new Error('Target element cannot be replaced without a valid parent container')
}

const preserveRootUniqueId = Parameters.PreserveRootUniqueId !== false
const preserveDescendantUniqueIds = Parameters.PreserveDescendantUniqueIds === true

const oldTargetIndex = parent.children.findIndex((child) => child.unique_id === target.unique_id)

if (oldTargetIndex === -1) {
  throw new Error('Target element is not present in parent.children')
}

const allExistingIds = buildExistingIdSet(elementTree)
const targetSubtreeIds = new Set(collectIds(target))
for (const id of targetSubtreeIds) allExistingIds.delete(id)

const replacement = normalizeTree({
  node: parsedTree,
  parentId: parent.unique_id,
  preserveRootUniqueId,
  forcedRootUniqueId: target.unique_id,
  preserveDescendantUniqueIds,
  usedIds: allExistingIds,
  depth: 0
})

replacement.childOrder = target.childOrder || oldTargetIndex + 1

parent.children.splice(oldTargetIndex, 1, replacement)

for (let i = 0; i < parent.children.length; i++) {
  parent.children[i].parent = parent.unique_id
  parent.children[i].childOrder = i + 1
}

parent.updatedAt = new Date().toISOString()

const countNodes = (node) => {
  let total = 1
  for (const child of node.children || []) total += countNodes(child)
  return total
}

const toReturn = {
  version: 2,
  app: Application,
  outcome: replacement,
  meta: {
    replacedElement: target.unique_id,
    resultingRoot: replacement.unique_id,
    parent: parent.unique_id,
    nodesInOldSubtree: countNodes(target),
    nodesInNewSubtree: countNodes(replacement)
  }
}

if (Parameters.expectedReturn === 'SMALL') {
  toReturn.app = undefined
}

return toReturn