const connectionString = Application.settings.development.dbconnectstring
const connection = await aptugo.db.connect(connectionString)

async function updateRows(data) {
  let doContinue = false
  let updateData = []

  if (data.length > 10) {
    updateData = data.splice(0, 10)
    doContinue = true
  } else {
    updateData = data
  }

  const collection = connection.collection(Parameters.Name)

  for (const row of updateData) {
    const keyValue = row[Parameters.keyField]

    if (keyValue === undefined || keyValue === null) continue

    const { [Parameters.keyField]: _, ...fieldsToUpdate } = row

    await collection.updateOne(
      { [Parameters.keyField]: keyValue },
      { $set: fieldsToUpdate }
    )
  }

  if (doContinue) {
    await updateRows(data)
  }
}

await updateRows([...Parameters.finalData])
return Application