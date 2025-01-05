
const unique = Parameters.unique_id || aptugo.generateID()
const newElement = {
  unique_id: unique,
  name: Parameters.name || 'Untitled',
  path: Parameters.element + '.tpl',
  type: 'element',
  value: Parameters.element,
  values: Parameters.values || {}
}

const container = aptugo.findPageInTree(Application.pages, Parameters.parent)

if (container) {
  if (!container.children) container.children = []
  container.children.push(newElement)
}

return Application