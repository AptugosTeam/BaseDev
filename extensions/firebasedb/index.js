const minimist = require('minimist')
const splitargs = require('splitargs')

const firebaseSidecar = {
  db: null,
  connect: (arguments) => {
    const { initializeApp, cert } = require('firebase-admin/app')
    const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore')

    initializeApp({
      credential: cert({
        project_id: arguments.projectId,
        client_email: arguments.clientEmail,
        private_key: arguments.privateKey
      })
    })
    
    firebaseSidecar.db = getFirestore()
    return 'ok'
  },
  listCollections: (arguments) => {
    if (!firebaseSidecar.db) firebaseSidecar.connect(arguments)
    return firebaseSidecar.db.listCollections().then(collections => {
      return collections.map(coll => coll.path)
    })
  },
  getFieldsFromCollection: (arguments) => {
    if (!firebaseSidecar.db) firebaseSidecar.connect(arguments)
    const collectionName = arguments.collection
    const collectionRef = firebaseSidecar.db.collection(collectionName)
    return collectionRef.get().then((querySnapshot) => {
      const document = querySnapshot.docs[0]
      const fields = document.data()
      return Object.keys(fields)
    })
  },
  run: async (theArguments, extraArguments = {}) => {
    let output = ''
    let args = { _:[] }
    if (typeof(theArguments) === 'string') {
      args = minimist(splitargs(theArguments))
    } else if (typeof(theArguments) === 'object') {
      args = { _:[], ...theArguments }
    } else {
      const workingParams = process.argv.slice(2)
      if (workingParams) {
        args = minimist(splitargs(workingParams.join(' ')))
      }
    }

    let cmd = args.order || args._[0]
    let subcmd = args

    switch (cmd) {
      case 'connect':
        output = firebaseSidecar.connect(subcmd)
        break
      case 'collections':
        output = firebaseSidecar.listCollections(subcmd)
        break
      case 'fields':
        output = firebaseSidecar.getFieldsFromCollection(subcmd)
    }

    if (output instanceof Promise) {
      return output.then(res => {
        return res
      })
    }
  }
}

module.exports = firebaseSidecar.run