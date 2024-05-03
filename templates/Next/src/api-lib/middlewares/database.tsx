/*
path: database.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/src/api-lib/middlewares/database.tsx
keyPath: src/api-lib/middlewares/database.tsx
unique_id: nfe788sq
*/
import { MongoClient } from 'mongodb'
{{ insert_setting('OnImportsDatabase') | raw }}
global.mongo = global.mongo || {}

let indexesCreated = false
async function createIndexes(db) {
  await Promise.all([
    {% for table in application.tables %}
    db
      .collection('{{ table.name | friendly | lower }}')
      .createIndex({ createdAt: -1 }),
    {% endfor %}
  ])
  indexesCreated = true
}

export async function getMongoClient() {
  if (!global.mongo.client) {
    global.mongo.client = new MongoClient(process.env.MONGODB_URI)
  }
  await global.mongo.client.connect()
  return global.mongo.client
}

export default async function database(req, res, next) {
  if (!global.mongo.client) {
    global.mongo.client = new MongoClient(process.env.MONGODB_URI)
  }
  req.dbClient = await getMongoClient()
  req.db = req.dbClient.db()
  if (!indexesCreated) await createIndexes(req.db)

  {{ insert_setting('OnSetupDatabase') | raw }}
  return next()
}
