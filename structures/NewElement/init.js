
const fixValues = (childList) => {
  for (var child of childList) {
    console.log('FIXING VALUES FOR ', child)
    if (!child.path) child.path = child.element + '.tpl'
    if (typeof child.values === 'string') child.values = JSON.parse(child.values)
    if (child.children) child.children = fixValues(child.children)
  }
  return childList
}

if (typeof Parameters.values === 'string') Parameters.values = JSON.parse(Parameters.values)

if (Parameters.children) Parameters.children = fixValues(Parameters.children)

const unique = Parameters.unique_id || aptugo.generateID()
const newElement = {
  unique_id: unique,
  name: Parameters.name || 'Untitled',
  path: Parameters.element + '.tpl',
  type: 'element',
  value: Parameters.element,
  values: Parameters.values || {},
  children: Parameters.children
}

console.log('this is the new element', JSON.stringify(newElement, null, 2))

const container = aptugo.findPageInTree(Application.pages, Parameters.parent)

if (container) {
  if (!container.children) container.children = []
  container.children.push(newElement)
}

return Application