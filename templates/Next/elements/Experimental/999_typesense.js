/*
path: 999_typesense.js
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/elements/Experimental/999_typesense.js
keyPath: elements/Experimental/999_typesense.js
unique_id: sFBPRd3J
*/

export async function createSchema(schema, typesense) {
  const collectionsList = await typesense.collections().retrieve()
  var toCreate = collectionsList.find((value, index, array) => {
    return value['name'] == schema['name']
  })

  if (!toCreate) {
    await typesense.collections().create(schema)
  }
}

export function closeChangeStream(timeInMs = 60000, changeStream) {
  return new Promise<void>(resolve => {
    setTimeout(() => {
      console.log('Closing the change stream')
      changeStream.close()
      resolve()
    }, timeInMs)
  })
}

export async function index(next, typesense) {
  console.log(next)
  if (next.operationType == 'delete') {
    await typesense.collections('articles').documents(next.documentKey._id).delete()
    console.log(next.documentKey._id)
  } else if (next.operationType == 'update') {
    let data = JSON.stringify(next.updateDescription.updatedFields)
    await typesense.collections('articles').documents(next.documentKey._id).update(data)
    console.log(data)
  } else {
    next.fullDocument.id = next.fullDocument['_id']
    delete next.fullDocument._id
    let data = JSON.stringify(next.fullDocument)
    await typesense.collections('articles').documents().upsert(data)
    console.log(data)
  }
}

export async function monitorListingsUsingEventEmitter(client, typesense, timeInMs = 60000) {
  const collection = client.collection('articles')
  const changeStream = collection.watch()
  changeStream.on('change', next => {
    index(next, typesense)
  })
  await closeChangeStream(timeInMs, changeStream)
}
