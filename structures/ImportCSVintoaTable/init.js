Parameters.unique_id = aptugo.generateID()
Parameters.fields = []
Parameters.Name = aptugo.friendly(Parameters.Name).toLowerCase()

const untitledTables = Application.tables.filter(table => table.name.substr(0,8) === 'Untitled').length
const singleName = `${Parameters.Name}record`

var contents = aptugo.readFile(Parameters.csv)
var finalFields = []
var lines = contents.split('\n')
var headers = lines.shift()
var fields = headers.split(',')
fields.forEach(field => {
  Parameters.fields.push(aptugo.friendly(field))
  finalFields.push({
    column_name: aptugo.friendly(field),
    data_type: "String",
    unique_id: aptugo.generateID()
  })
})

const newTable = {
  type: 'table',
  unique_id: Parameters.unique_id,
  name: Parameters.Name,
  singleName: singleName,
  subtype: 'Aptugo',
  children: [],
  fields: finalFields
}

if (!Application.tables) Application.tables = []
Application.tables.push(newTable)
return Application
