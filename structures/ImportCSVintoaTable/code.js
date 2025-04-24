async function addRows(data) {
  let doContinue = false
  let insertData = []
  if (data.length > 10) {
    insertData = data.splice(0, 10)
    doContinue = true
  } else {
    insertData = data
  }
  const result = await aptugo.db.insertRows(connection, Parameters.Name, insertData)
  console.log('3 - CSV IMPORT', insertData)
  if (doContinue) addRows(data)
}

var csvData = Parameters.csvData

const connectionString = Application.settings.development.dbconnectstring
const connection = await aptugo.db.connect(connectionString)

await addRows(csvData)
// aptugo.db.close()
return Application
