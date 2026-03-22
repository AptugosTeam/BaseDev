const runStructure = async (name, args) => {
  const res = await aptugo.structures.run(name, args)
  return res?.data || res
}

// Normalize input into array of table IDs
let tableIds = []

if (Array.isArray(Parameters.Tables)) {
  tableIds = Parameters.Tables.map(t => t.unique_id).filter(Boolean)
} else if (Parameters.TablePayload && Parameters.TablePayload.unique_id) {
  tableIds = [Parameters.TablePayload.unique_id]
} else if (Parameters.unique_id) {
  tableIds = [Parameters.unique_id]
}

// Run ABM creation per table
for (const tableId of tableIds) {
  Application = await runStructure('Autocreate ABM pages', {
    unique_id: tableId,
    state: { ...State, app: Application }
  })
}

return Application