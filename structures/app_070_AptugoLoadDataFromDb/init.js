const connectionString = Application.settings.development.dbconnectstring
const connection = await aptugo.db.connect(connectionString)

const tableName = Parameters.Name
const query = Parameters.Query || {}
const sort = Parameters.Sort || {}
const projection = Parameters.Projection || {}
const limit = Parameters.Limit ? Number(Parameters.Limit) : 0
const skip = Parameters.Skip ? Number(Parameters.Skip) : 0

const rows = await aptugo.db.getRows(connection, tableName, query, {
  sort,
  projection,
  limit,
  skip
})

return rows