const findNodeAndParent = (nodes, unique_id, parent = null) => {
  for (const node of nodes || []) {
    if (node.unique_id === unique_id) {
      return { node, parent }
    }

    if (node.children && node.children.length) {
      const found = findNodeAndParent(node.children, unique_id, node)
      if (found) return found
    }
  }

  return null
}

const reorderChildren = (children, parentId) => {
  ;(children || []).forEach((child, index) => {
    child.parent = parentId
    child.childOrder = index + 1
  })
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

if (!Parameters.Element) {
  throw new Error('Update Element requires parameter: Element')
}

const found = findNodeAndParent(Application.pages, Parameters.Element)

if (!found || !found.node || found.node.type !== 'element') {
  throw new Error(`Element not found: ${Parameters.Element}`)
}

const element = found.node
const oldParent = found.parent

if (typeof Parameters.Name !== 'undefined') {
  element.name = Parameters.Name
}

if (typeof Parameters.Path !== 'undefined') {
  element.path = Parameters.Path
}

if (typeof Parameters.Value !== 'undefined') {
  element.value = Parameters.Value
}

if (typeof Parameters.Cascades !== 'undefined') {
  element.cascades = Parameters.Cascades
}

if (typeof Parameters.Prevent_delete !== 'undefined') {
  element.prevent_delete = Parameters.Prevent_delete
}

if (typeof Parameters.Values !== 'undefined') {
  const parsedValues = parseMaybeObject(Parameters.Values, 'Values')
  element.values = parsedValues || {}
}

if (typeof Parameters.ClassName !== 'undefined') {
  element.values = element.values || {}
  element.values.className = Array.isArray(Parameters.ClassName)
    ? Parameters.ClassName
    : [Parameters.ClassName]
}

if (Parameters.Parent && (!oldParent || Parameters.Parent !== oldParent.unique_id)) {
  const newParentFound = findNodeAndParent(Application.pages, Parameters.Parent)

  if (!newParentFound || !newParentFound.node) {
    throw new Error(`Target parent not found: ${Parameters.Parent}`)
  }

  const newParent = newParentFound.node

  if (!Array.isArray(newParent.children)) {
    newParent.children = []
  }

  if (oldParent && Array.isArray(oldParent.children)) {
    oldParent.children = oldParent.children.filter((child) => child.unique_id !== element.unique_id)
    reorderChildren(oldParent.children, oldParent.unique_id)
  } else {
    throw new Error('Element cannot be moved without a valid parent container')
  }

  element.parent = newParent.unique_id
  element.childOrder = newParent.children.length + 1
  newParent.children.push(element)
}

const currentParentRef = findNodeAndParent(Application.pages, element.unique_id)?.parent

if (typeof Parameters.ChildOrder !== 'undefined' && currentParentRef && Array.isArray(currentParentRef.children)) {
  const siblings = currentParentRef.children.filter((child) => child.unique_id !== element.unique_id)
  const targetIndex = Math.max(0, Math.min(Number(Parameters.ChildOrder) - 1, siblings.length))

  siblings.splice(targetIndex, 0, element)
  currentParentRef.children = siblings
  reorderChildren(currentParentRef.children, currentParentRef.unique_id)
}

element.updatedAt = new Date().toISOString()

return Application