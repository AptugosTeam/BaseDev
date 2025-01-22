/*
path: database.tsx
keyPath: src/api-lib/middlewares/database.tsx
unique_id: nfe788sq
*/
import mongoose from 'mongoose'

{{ insert_setting('OnImportsDatabase') | raw }}

export default async function database(req, res, next) {
  req.db = mongoose.connect(process.env.MONGODB_URI, {
    autoIndex: true
  })

  {{ insert_setting('OnSetupDatabase') | raw }}
  return next()
}
