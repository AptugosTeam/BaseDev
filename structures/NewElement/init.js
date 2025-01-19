
if (typeof Parameters.values === 'string') Parameters.values = JSON.parse(Parameters.values)
const unique = Parameters.unique_id || aptugo.generateID()
const newElement = {
  unique_id: unique,
  name: Parameters.name || 'Untitled',
  path: Parameters.element + '.tpl',
  type: 'element',
  value: Parameters.element,
  values: Parameters.values || {}
}

console.log('this is the new element', JSON.stringify(newElement, null, 2))

const container = aptugo.findPageInTree(Application.pages, Parameters.parent)

if (container) {
  if (!container.children) container.children = []
  container.children.push(newElement)
}

return Application