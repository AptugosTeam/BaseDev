const connectionString = Application.settings.development.dbconnectstring;
const connection = await aptugo.db.connect(connectionString)

async function addRows(data) {
  let doContinue = false;
  let insertData = [];
  if (data.length > 10) {
    insertData = data.splice(0, 10);
    doContinue = true;
  } else {
    insertData = data;
  }
  await aptugo.db.insertRows(connection, Parameters.Name, insertData);
  if (doContinue) addRows(data);
}

console.log('Connection ', connection)
// await addRows(finalData)
return Application;
