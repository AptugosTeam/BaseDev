const makeId = () => {
  return Math.random().toString(36).slice(2, 10)
}

const nowIso = () => new Date().toISOString()

const cloneDeep = (obj) => {
  if (typeof structuredClone === 'function') return structuredClone(obj)
  return JSON.parse(JSON.stringify(obj))
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

const ensureArray = (value, fieldName) => {
  if (typeof value === 'undefined' || value === null) return []
  if (!Array.isArray(value)) throw new Error(`${fieldName} must be an array`)
  return value
}

const getPageRoots = () => {
  if (!Application) {
    throw new Error('Application is not available')
  }

  if (Array.isArray(Application.pages)) {
    return Application.pages
  }

  if (Application.pages && typeof Application.pages === 'object') {
    return Object.values(Application.pages)
  }

  if (Application.store?.pages && typeof Application.store.pages === 'object') {
    return Object.values(Application.store.pages)
  }

  throw new Error(
    'Application.pages is not available as an array or object. Make sure the application is fully loaded before running Replace Element Tree.'
  )
}

const collectIds = (node, bucket = []) => {
  if (!node || typeof node !== 'object') return bucket
  if (node.unique_id) bucket.push(node.unique_id)
  for (const child of node.children || []) collectIds(child, bucket)
  return bucket
}

const buildExistingIdSet = (nodes, bucket = new Set()) => {
  for (const node of nodes || []) {
    if (node?.unique_id) bucket.add(node.unique_id)
    if (Array.isArray(node?.children) && node.children.length > 0) {
      buildExistingIdSet(node.children, bucket)
    }
  }
  return bucket
}

const countNodes = (node) => {
  let total = 1
  for (const child of node.children || []) total += countNodes(child)
  return total
}

const getNodeLabel = (node) => {
  return node?.unique_id || node?.name || node?.value || '(unnamed)'
}

const isReservedShellElement = (node) => {
  const reservedValues = new Set(['bpr', 'ph', 'b', 'pf', 'apr'])
  const reservedPaths = new Set(['bpr.tpl', 'ph.tpl', 'b.tpl', 'pf.tpl', 'apr.tpl'])
  return reservedValues.has(node?.value) || reservedPaths.has(node?.path)
}

const findNodeStrict = (nodes, selector) => {
  const matches = []

  const walk = (items, parent = null) => {
    for (const node of items || []) {
      if (!node || typeof node !== 'object') continue

      if (
        node.unique_id === selector ||
        node.name === selector ||
        node.value === selector
      ) {
        matches.push({ node, parent })
      }

      if (Array.isArray(node.children) && node.children.length > 0) {
        walk(node.children, node)
      }
    }
  }

  walk(nodes)

  if (matches.length === 0) {
    throw new Error(`Element not found (by id, name, or value): ${selector}`)
  }

  const exactId = matches.find((match) => match.node.unique_id === selector)
  if (exactId) return exactId

  if (matches.length > 1) {
    const preview = matches
      .slice(0, 5)
      .map((match) => getNodeLabel(match.node))
      .join(', ')
    throw new Error(
      `Element selector is ambiguous: ${selector}. Matched ${matches.length} elements (${preview}). Use unique_id instead.`
    )
  }

  return matches[0]
}

const generateUniqueId = (usedIds, regeneratedIds) => {
  let id = makeId()
  while (usedIds.has(id)) {
    id = makeId()
  }
  usedIds.add(id)
  regeneratedIds.push(id)
  return id
}

const normalizeTree = ({
  node,
  parentId,
  preserveRootUniqueId,
  forcedRootUniqueId,
  preserveDescendantUniqueIds,
  usedIds,
  regeneratedIds,
  depth = 0,
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
    const mayPreserveId =
      candidateId &&
      (
        (depth === 0 && !preserveRootUniqueId) ||
        (depth > 0 && preserveDescendantUniqueIds)
      ) &&
      !usedIds.has(candidateId)

    if (mayPreserveId) {
      normalized.unique_id = candidateId
      usedIds.add(candidateId)
    } else {
      normalized.unique_id = generateUniqueId(usedIds, regeneratedIds)
    }
  }

  normalized.parent = parentId || null
  normalized.children = []
  normalized.updatedAt = nowIso()

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
      regeneratedIds,
      depth: depth + 1,
    })

    normalizedChild.childOrder = i + 1
    normalized.children.push(normalizedChild)
  }

  return normalized
}

const replaceChildInParent = (parent, targetUniqueId, replacement) => {
  if (!parent || !Array.isArray(parent.children)) {
    throw new Error('Target element cannot be replaced without a valid parent container')
  }

  const oldTargetIndex = parent.children.findIndex(
    (child) => child?.unique_id === targetUniqueId
  )

  if (oldTargetIndex === -1) {
    throw new Error('Target element is not present in parent.children')
  }

  parent.children.splice(oldTargetIndex, 1, replacement)

  for (let i = 0; i < parent.children.length; i++) {
    parent.children[i].parent = parent.unique_id
    parent.children[i].childOrder = i + 1
    parent.children[i].updatedAt = parent.children[i].updatedAt || nowIso()
  }

  parent.updatedAt = nowIso()

  return oldTargetIndex
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

const elementTree = getPageRoots()
const found = findNodeStrict(elementTree, Parameters.Element)

if (!found?.node || found.node.type !== 'element') {
  throw new Error(`Element not found (by id, name, or value): ${Parameters.Element}`)
}

const target = found.node
const parent = found.parent

if (!parent || !Array.isArray(parent.children)) {
  throw new Error('Target element cannot be replaced without a valid parent container')
}

if (
  isReservedShellElement(target) &&
  Parameters.AllowReservedShellReplacement !== true
) {
  throw new Error(
    `Refusing to replace reserved shell element: ${getNodeLabel(target)}. Pass AllowReservedShellReplacement=true to override.`
  )
}

const preserveRootUniqueId = Parameters.PreserveRootUniqueId !== false
const preserveDescendantUniqueIds = Parameters.PreserveDescendantUniqueIds === true

const allExistingIds = buildExistingIdSet(elementTree)
const targetSubtreeIds = new Set(collectIds(target))
for (const id of targetSubtreeIds) allExistingIds.delete(id)

const regeneratedIds = []

const replacement = normalizeTree({
  node: parsedTree,
  parentId: parent.unique_id,
  preserveRootUniqueId,
  forcedRootUniqueId: target.unique_id,
  preserveDescendantUniqueIds,
  usedIds: allExistingIds,
  regeneratedIds,
  depth: 0,
})

const targetIndex = parent.children.findIndex((child) => child?.unique_id === target.unique_id)
if (targetIndex === -1) {
  throw new Error('Target element is not present in parent.children')
}

replacement.childOrder = target.childOrder || targetIndex + 1

replaceChildInParent(parent, target.unique_id, replacement)

const toReturn = {
  version: 3,
  app: Application,
  outcome: replacement,
  meta: {
    replacedElement: target.unique_id,
    replacedElementName: target.name || null,
    resultingRoot: replacement.unique_id,
    parent: parent.unique_id,
    parentName: parent.name || null,
    nodesInOldSubtree: countNodes(target),
    nodesInNewSubtree: countNodes(replacement),
    preserveRootUniqueId,
    preserveDescendantUniqueIds,
    regeneratedIds,
  },
}

return toReturn