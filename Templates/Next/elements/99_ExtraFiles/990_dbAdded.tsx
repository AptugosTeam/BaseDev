/*
path: 990_dbAdded.tsx
keyPath: elements/99_ExtraFiles/990_dbAdded.tsx
unique_id: 7lOHGwt2
*/
import bcrypt from 'bcryptjs'
import { {{ insert_setting('userControlModel') }} as model } from '@/models'

export async function findUserForAuth(db, userId) {
  return await model.findOne({ _id: userId }, { projection: { password: 0 } })
}

export async function findUserWithEmailAndPassword(email, password) {
  return new Promise((resolve, reject) => {
    model.findOne({ Email: email }).then(async user => {
      if (user && (await bcrypt.compare(password, user.Password))) {
        resolve(user)
      } else {
        reject('Wrong Username or Password')
      }
    }).catch((error) => {
      reject(error)
    })
  })
}
