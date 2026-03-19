const tableId = Parameters.unique_id
const table = Application.tables.find((tbl) => tbl.unique_id === tableId)

if (!table) {
  throw new Error(`Table not found: ${tableId}`)
}

const updateElementTree = (nodes) => {
  for (const node of nodes || []) {
    if (!node || typeof node !== 'object') continue

    if (node.type === 'page' && node.asociated_table === table.unique_id && node.autoSyncFromTable !== false) {
      node.name = table.name
      node.path = `/${table.name}`
      node.filename = `${table.name}.tsx`
    }

    if (node.type === 'element' && node.values && typeof node.values === 'object') {
      // Heading text
      if (node.value === 'text' && node.values.Content) {
        if (
          node.values.Content.includes(' list') ||
          node.values.Content.includes('Add ') ||
          node.values.Content.includes('Edit ') ||
          node.values.Content.includes('Enter ') ||
          node.values.Content.includes('Update ')
        ) {
          if (node.values.Content.includes(' list')) {
            node.values.Content = `${table.singleName} list`
          }
        }
      }

      // Dialog labels
      if (node.value === 'dialog') {
        if (node.values.title) node.values.title = `Add ${table.singleName}`
        if (node.values.introText) node.values.introText = `Enter ${table.singleName} data`
        if (node.values.editTitle) node.values.editTitle = `Edit ${table.singleName}`
        if (node.values.editIntroText) node.values.editIntroText = `Update ${table.singleName} data`
      }
    }

    if (node.children && Array.isArray(node.children)) {
      updateElementTree(node.children)
    }
  }
}

updateElementTree(Application.pages)

return Application