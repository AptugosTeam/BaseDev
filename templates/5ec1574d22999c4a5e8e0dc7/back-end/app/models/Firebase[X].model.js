/*
path: "{{ table.name |\_friendly |\_lower }}.model.js"
type: file
unique_id: fnd3TqFB
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Firebase
children: []
*/
{{ add_setting('Packages', '"firebase": "9.21.0","firebase-admin": "11.7.0",') }}
{% set friendlyTableName = table.name | friendly %}
const { initializeApp, cert } = require('firebase-admin/app')
const { getFirestore, DocumentReference, Timestamp, FieldValue } = require('firebase-admin/firestore')

{% set privKeyHack = table.privateKey| replace({ "\r\n": "\REPLACEME", "\n": "\REPLACEME", "\r": "\REPLACEME" }) %}
try {
  initializeApp({
    credential: cert({
      project_id: '{{ table.projectId }}',
      client_email: '{{ table.clientEmail }}',
      private_key: '{{ privKeyHack | replace({"REPLACEME":"n"}) | raw }}'
    })
  })
} catch(e) {}

const db = getFirestore()
const usersCollection = db.collection('{{ table.collection }}')

const {{ friendlyTableName }}Schema = {
  {% for field in table.fields %}
    {% set fieldInfo = field | fieldData %}
    {% set output = {
      rawString: '',
      fieldInfo: fieldInfo,
      extraImports: extraImports,
      extraPlugins: extraPlugins
    }%}
    {% set data %}
      {% include includeTemplate(['Fields' ~ field.data_type ~ 'model.tpl', 'Fieldsmodel.tpl']) %}
    {% endset %}
    {% set output = (data|json_decode) ?? data %}
    {% if output.extraImports %}{% set extraImports = extraImports ~ output.extraImports %}{% endif %}
    {% if output.extraPlugins %}{% set extraPlugins = extraPlugins ~ output.extraPlugins %}{% endif %}
    {{ output.rawString ?? data }}
  {% endfor %}
}

const {{ friendlyTableName }}Model = {
  create: async function(userData, returnRef = false) {
    try {
      const docRef = await usersCollection.add(userData)
      return returnRef ? docRef : docRef.id
    } catch (error) {
      console.error(error)
      return null
    }
  },

  getById: async function(id) {
    try {
      const doc = await usersCollection.doc(id).get()
      if (!doc.exists) {
        return null
      }
      return { id: doc.id, ...doc.data() }
    } catch (error) {
      console.error(error)
      return null
    }
  },

  updateById: async function(id, userData) {
    try {
      await usersCollection.doc(id).update(userData)
      return true
    } catch (error) {
      console.error(error)
      return false
    }
  },

  deleteById: async function(id) {
    try {
      await usersCollection.doc(id).delete()
      return true
    } catch (error) {
      console.error(error)
      return false
    }
  },

  find: async function(options = {}) {
    try {
      const totalDocs = await (await usersCollection.count().get()).data().count
      const limit = Number(options.limit) || 10
      const page = Number(options.page) || 1
      let query = usersCollection
      query = query.offset((page - 1) * limit).limit(limit)
      const snapshot = await query.get()
      return await {{ friendlyTableName }}Model.paginateAndFill(snapshot, { ...options, totalDocs: totalDocs })
    } catch (error) {
      console.error(error)
      return false
    }
  },

  search: async function (searchField, searchTerm, options = {}) {
    let query = usersCollection
    query = query.where(searchField, '>=', searchTerm).where(searchField, '<=', searchTerm + '\uf8ff')
    const snapshot = await query.get()
    return await {{ friendlyTableName }}Model.paginateAndFill(snapshot, options)
  },

  paginateAndFill: async function (querySnapshot, options = {}) {
    const output = {
      hasNextPage: false,
      hasPrevPage: false,
      limit: Number(options.limit) || 10,
      nextPage: 11,
      page: Number(options.page) || 1,
      pagingCounter: 1,
      prevPage: null,
      totalDocs: options.totalDocs || querySnapshot.size,
      totalPages: Math.ceil(querySnapshot.size / (Number(options.limit) || 10)),
      docs: [],
    }

    if (output.totalPages > output.page) {
      output.hasNextPage = true
      output.nextPage = output.page * output.limit + output.limit
    }
    if (output.page > 1) output.hasPrevPage = true

    const promises = querySnapshot.docs.map((doc) => {
      return Promise.all(
        Object.keys(doc.data()).map((key) => {
          if (doc.data()[key] instanceof DocumentReference) {
            return doc.data()[key].get().then((snapshot) => {
              return { [key]: { ...snapshot.data(), _id: snapshot.id } }
            })
          } else {
            return Promise.resolve({ [key]: doc.data()[key] })
          }
        })
      ).then((references) => {
        const data = references.reduce((acc, cur) => {
          return {
            ...acc,
            ...cur
          }
        }, {})
  
        return {
          _id: doc.id,
          ...data
        }
      })
    })
  
    return Promise.all(promises).then((documents) => {
      output.docs = documents
      return output
    })
  }
}

module.exports = {{ friendlyTableName }}Model