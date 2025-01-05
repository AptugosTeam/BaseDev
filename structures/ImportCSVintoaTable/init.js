const untitledTables = Application.tables.filter( (table) => table.name.substr(0, 8) === 'Untitled' ).length

if (!Parameters.Name) {
  Parameters.Name = `Untitled`
  if (untitledTables > 0) Parameters.Name = Parameters.Name + ` (${untitledTables})`
}

Parameters.unique_id = aptugo.generateID()
Parameters.fields = []
Parameters.Name = aptugo.friendly(Parameters.Name).toLowerCase()

for (var file of Parameters.uploadFiles) {
  const buffer = Buffer.from(new Uint8Array(file.contents))
  const contents = buffer.toString()

  const singleName = `${Parameters.Name}record`

  var finalFields = []
  var lines = contents.split('\n')
  var headers = lines.shift()
  var fields = headers.split(',')
  
  fields.forEach((field) => {
    Parameters.fields.push(aptugo.friendly(field))
    finalFields.push({
      column_name: aptugo.friendly(field),
      data_type: 'String',
      unique_id: aptugo.generateID(),
    })
  })

  Application = await aptugo.structures.run('New Table', {
    unique_id: Parameters.unique_id,
    name: Parameters.Name || 'UntitledImport',
    singleName: singleName,
    fields: finalFields,
    state: { ...State, app: Application } } )

  const newTable = Application.tables.find(tlb => tlb.unique_id === Parameters.unique_id)

  Parameters.contents = contents
}

return Application
