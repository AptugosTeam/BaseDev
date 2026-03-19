const findTableIndex = (ref) => {
  return Application.tables.findIndex((table) =>
    table.unique_id === ref ||
    table._id === ref ||
    table.name === ref
  )
}

if (Parameters.nameChanged || Parameters.singleNameChanged || 1 === 1) {
  const tableRef = Parameters.Table
  const tableIndex = findTableIndex(tableRef)
  if (tableIndex === -1) return { error: `Table not found: ${tableRef}` }

  const table = Application.tables[tableIndex]
  Application = await aptugo.structures.run('Sync ABM Pages From Table', {
    unique_id: table.unique_id,
    state: { ...State, app: Application }
  })
}

return Application