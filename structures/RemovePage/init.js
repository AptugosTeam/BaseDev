const container = aptugo.findPageInTree(Application.pages, Parameters.pageID)
if (!container.parent) {
  Application.pages = Application.pages.filter(page => page.unique_id !== container.unique_id)
} else {
  const parent = aptugo.findPageInTree(Application.pages, container.parent)
  parent.children = parent.children.filter(page => page.unique_id !== container.unique_id)
}
return Application