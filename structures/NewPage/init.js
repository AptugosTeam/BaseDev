
if (!Parameters.pageTemplate) {
  const unique = Parameters.unique_id || aptugo.generateID()
  const pageName = Parameters.name || Parameters.Name || 'Untitled'
  const pagePath = Parameters.path || Parameters.Path || ''
  const pageFilename = Parameters.filename || Parameters.Filename || 'untitled.tsx'

  const newPage = {
    unique_id: unique,
    name: pageName,
    path: pagePath,
    filename: pageFilename,
    type: 'page',
    children: [
      {
        name: 'Before Page Render',
        type: 'element',
        value: 'bpr',
        prevent_delete: true,
        cascades: false,
        children: [],
        unique_id: unique + 'BPR'
      },
      {
        name: 'Page Header',
        type: 'element',
        value: 'ph',
        prevent_delete: true,
        children: [],
        cascades: false,
        unique_id: unique + 'PH'
      },
      {
        name: 'Body',
        type: 'element',
        value: 'b',
        prevent_delete: true,
        cascades: false,
        children: [],
        unique_id: unique + 'B'
      },
      {
        name: 'Page Footer',
        type: 'element',
        value: 'pf',
        prevent_delete: true,
        cascades: false,
        children: [],
        unique_id: unique + 'PF'
      },
      {
        name: 'After Page Render',
        type: 'element',
        value: 'apr',
        prevent_delete: true,
        cascades: false,
        children: [],
        unique_id: unique + 'APR'
      }
    ]
  }

  if (Parameters.parentPage || Parameters.parent) {
    const container = aptugo.findPageInTree(
      Application.pages,
      Parameters.parentPage || Parameters.parent
    )
    if (container) container.children.push(newPage)
    else Application.pages.push(newPage)
  } else {
    Application.pages.push(newPage)
  }
} else {
  aptugo.structures.run(Parameters.pageTemplate, Parameters )
}

return Application