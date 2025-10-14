

const elementOriginalID = Parameters.original_id
const unique = Parameters.unique_id || aptugo.generateID()
const newPage = {
  unique_id: unique,
  name: Parameters.name || 'Untitled',
  path: Parameters.path,
  parent: Parameters.parent,
  type: 'page',
  filename: Parameters.filename
}

console.log('this is what it came', JSON.stringify(newPage,null,2))

const container = aptugo.findPageInTree(Application.pages, Parameters.parent)

if (container) {
  if (!container.children) container.children = []
  const originalPage = container.children.find(e => e.unique_id === elementOriginalID)
  const pageToReplace = container.children.findIndex(e => e.unique_id === elementOriginalID)
  console.log('this is the original page', JSON.stringify(originalPage,null,2))
  newPage.children = originalPage.children

  container.children[pageToReplace] = newPage
}

console.log('this is the new page', JSON.stringify(newPage,null,2))

return Application
