if (Parameters.Path) Parameters.path = Parameters.Path
if (Parameters.Name) Parameters.name = Parameters.Name
if (Parameters.Value) {
  Parameters.value = Parameters.Value
  Parameters.element = Parameters.value 
} else if (Parameters.Element) Parameters.element = Parameters.Element
if (Parameters.Parent) Parameters.parent = Parameters.Parent
if (Parameters.Values) Parameters.values = Parameters.Values

// 🔥 normalize Children
if (Parameters.Children) Parameters.children = Parameters.Children

const fixValues = (childList) => {
  for (const child of childList) {
    if (child.Element) child.element = child.Element
    if (child.Name) child.name = child.Name
    if (child.Path) child.path = child.Path
    if (child.Value) {
      child.value = child.Value
      child.element = child.value
    }
    if (child.Values) child.values = child.Values
    if (child.Children) child.children = child.Children

    if (!child.path) child.path = child.element + '.tpl'
    if (typeof child.values === 'string') child.values = JSON.parse(child.values)

    if (child.children) child.children = fixValues(child.children)
  }
  return childList
}

if (typeof Parameters.values === 'string') Parameters.values = JSON.parse(Parameters.values)

if (Parameters.children) Parameters.children = fixValues(Parameters.children)

const container = aptugo.findPageInTree(Application.pages, Parameters.parent)

if (!container) {
  throw new Error(`Parent container not found: ${Parameters.parent}`)
}

if (!container.children) container.children = []

const createdIds = []

const createElementRecursive = (elementParams, parentContainer) => {
  const unique = elementParams.unique_id || aptugo.generateID()

  console.log(`creating recursive element ${unique} in ${parentContainer.unique_id} (${parentContainer.name})`)
  const newElement = {
    unique_id: unique,
    name: elementParams.name || 'Untitled',
    path: elementParams.path || elementParams.element + '.tpl',
    type: 'element',
    value: elementParams.element || elementParams.path.substring(0, elementParams.path.length - 4),
    values: elementParams.values || {},
    children: []
  }

  parentContainer.children.push(newElement)
  createdIds.push(unique)

  // 🔥 recursion now works
  if (elementParams.children && elementParams.children.length) {
    for (const child of elementParams.children) {
      createElementRecursive(child, newElement)
    }
  }

  return newElement
}

createElementRecursive(Parameters, container)

// ✅ validation
console.log('container.children', container.children)
// for (const id of createdIds) {
//   const found = container.children.find(child => child && child.unique_id === id)
//   if (!found) {
//     throw new Error(`Element creation failed. Element ${id} not found.`)
//   }
// }

return Application