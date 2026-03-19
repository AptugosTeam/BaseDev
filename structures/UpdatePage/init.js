if (!Parameters.Parentpage && Parameters.parent) Parameters.Parentpage = Parameters.parent

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

const ensureElementIds = (elements, parentId) => {
  return (elements || []).map((element, index) => ({
    unique_id: element.unique_id || aptugo.generateID(),
    parent: parentId,
    childOrder: index + 1,
    ...element,
    children: ensureElementIds(element.children || [], element.unique_id || aptugo.generateID())
  }))
}

const createDefaultShell = (pageId) => {
  const shell = [
    {
      name: 'Before Page Render',
      type: 'element',
      value: 'bpr',
      path: 'bpr.tpl',
      prevent_delete: true,
      cascades: false,
      children: []
    },
    {
      name: 'Page Header',
      type: 'element',
      value: 'ph',
      path: 'ph.tpl',
      prevent_delete: true,
      cascades: false,
      children: []
    },
    {
      name: 'Body',
      type: 'element',
      value: 'b',
      path: 'b.tpl',
      prevent_delete: true,
      cascades: false,
      children: []
    },
    {
      name: 'Page Footer',
      type: 'element',
      value: 'pf',
      path: 'pf.tpl',
      prevent_delete: true,
      cascades: false,
      children: []
    },
    {
      name: 'After Page Render',
      type: 'element',
      value: 'apr',
      path: 'apr.tpl',
      prevent_delete: true,
      cascades: false,
      children: []
    }
  ]

  return shell.map((item, index) => ({
    ...item,
    unique_id: aptugo.generateID(),
    parent: pageId,
    childOrder: index + 1
  }))
}

const ensureShell = (page) => {
  const currentChildren = Array.isArray(page.children) ? page.children : []
  const currentValues = new Set(currentChildren.map((child) => child.value))

  const defaults = [
    { name: 'Before Page Render', value: 'bpr', path: 'bpr.tpl' },
    { name: 'Page Header', value: 'ph', path: 'ph.tpl' },
    { name: 'Body', value: 'b', path: 'b.tpl' },
    { name: 'Page Footer', value: 'pf', path: 'pf.tpl' },
    { name: 'After Page Render', value: 'apr', path: 'apr.tpl' }
  ]

  let nextOrder = currentChildren.reduce((max, child) => {
    return Math.max(max, Number(child.childOrder) || 0)
  }, 0)

  defaults.forEach((def) => {
    if (!currentValues.has(def.value)) {
      nextOrder += 1
      currentChildren.push({
        unique_id: aptugo.generateID(),
        name: def.name,
        type: 'element',
        value: def.value,
        path: def.path,
        prevent_delete: true,
        cascades: false,
        parent: page.unique_id,
        childOrder: nextOrder,
        children: []
      })
    }
  })

  page.children = currentChildren
}

if (!Parameters.Page) {
  throw new Error('Modify Page requires parameter: Page')
}

const found = findNodeAndParent(Application.pages, Parameters.Page)

if (!found || !found.node || found.node.type !== 'page') {
  throw new Error(`Page not found: ${Parameters.Page}`)
}

const page = found.node
const oldParent = found.parent

if (typeof Parameters.Name !== 'undefined') {
  page.name = Parameters.Name
}

if (typeof Parameters.Path !== 'undefined') {
  page.path = Parameters.Path
}

if (typeof Parameters.Filename !== 'undefined') {
  page.filename = Parameters.Filename
}

if (Parameters.resetShell) {
  page.children = createDefaultShell(page.unique_id)
} else if (Parameters.ensureShell) {
  ensureShell(page)
}

if (Parameters.Parentpage && Parameters.Parentpage !== page.parent) {
  const newParentFound = findNodeAndParent(Application.pages, Parameters.Parentpage)

  if (!newParentFound || !newParentFound.node || newParentFound.node.type !== 'page') {
    throw new Error(`Target parent page not found: ${Parameters.Parentpage}`)
  }

  if (oldParent && Array.isArray(oldParent.children)) {
    oldParent.children = oldParent.children.filter((child) => child.unique_id !== page.unique_id)
  } else {
    Application.pages = Application.pages.filter((child) => child.unique_id !== page.unique_id)
  }

  page.parent = newParentFound.node.unique_id
  newParentFound.node.children = newParentFound.node.children || []
  page.childOrder = newParentFound.node.children.length + 1
  newParentFound.node.children.push(page)
}

page.updatedAt = new Date().toISOString()

return Application
