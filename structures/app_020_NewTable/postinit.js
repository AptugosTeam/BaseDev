const runStructure = async (name, args) => {
  const res = await aptugo.structures.run(name, args)
  return res?.data || res
}

const normalizePayload = (value) => {
  if (!value) return value
  if (typeof value !== 'string') return value

  try {
    return JSON.parse(value)
  } catch (_error) {
    return value
  }
}

const normalizedTables = normalizePayload(Parameters.Tables)
const normalizedTablePayload = normalizePayload(Parameters.TablePayload)

const findMatchingTableId = (tableLike) => {
  if (!tableLike || typeof tableLike !== 'object') return null
  if (tableLike.unique_id) return tableLike.unique_id

  const matchingTable = Application.tables.find((table) => {
    if (tableLike.name && table.name !== tableLike.name) return false
    if (tableLike.singleName && table.singleName !== tableLike.singleName) return false
    if (tableLike.subtype && table.subtype !== tableLike.subtype) return false
    return true
  })

  return matchingTable?.unique_id || null
}

let tableIds = []

if (Array.isArray(normalizedTables)) {
  tableIds = normalizedTables.map(table => findMatchingTableId(table)).filter(Boolean)
} else if (normalizedTablePayload && typeof normalizedTablePayload === 'object') {
  const resolvedId = findMatchingTableId(normalizedTablePayload)
  if (resolvedId) tableIds = [resolvedId]
} else if (Parameters.unique_id) {
  tableIds = [Parameters.unique_id]
} else {
  const resolvedId = findMatchingTableId({
    name: Parameters.name,
    singleName: Parameters.singleName,
    subtype: Parameters.subtype
  })
  if (resolvedId) tableIds = [resolvedId]
}

for (const tableId of tableIds) {
  Application = await runStructure('Autocreate ABM pages', {
    unique_id: tableId,
    state: { ...State, app: Application }
  })
}

return Application
