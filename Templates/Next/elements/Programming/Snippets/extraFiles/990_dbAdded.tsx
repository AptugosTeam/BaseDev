/*
path: 990_dbAdded.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/elements/Programming/Snippets/extraFiles/990_dbAdded.tsx
keyPath: elements/Programming/Snippets/extraFiles/990_dbAdded.tsx
unique_id: 7lOHGwt2
*/
import { ObjectId } from 'mongodb'
import bcrypt from 'bcryptjs'

export async function findUserForAuth(db, userId) {
  return db
    .collection('users')
    .findOne({ _id: new ObjectId(userId) }, { projection: { password: 0 } })
    .then((user) => user || null);
}

export async function findUserWithEmailAndPassword(db, email, password) {
  const user = await db.collection('users').findOne({ email });
  return { ...user, password: undefined }
  if (user && (await bcrypt.compare(password, user.password))) {
    return { ...user, password: undefined }; // filtered out password
  }
  return null;
}
