/*
path: "{{ table.name |\_friendly |\_lower }}.controller.js"
type: file
unique_id: gSp3dULo
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/


const {{ table.name | friendly }} = require('../models/{{ table.name | friendly | lower }}.model.js')
const fs = require('fs')
const paginate = require('../paginate')
const errors = require('../services/errors.service')

{% for field in table.fields %}
  {% set fieldWithData = field | fieldData %}
  {% include includeTemplate(['Fields' ~ field.data_type ~'updateImports.tpl', 'FieldsupdateImports.tpl']) %}
{% endfor %}

// Create and Save a new {{ table.singleName | friendly }}
exports.create = async (options) => {
  const data = options.req ? options.req.body : options.data
  const updatedData = {}

  {% for field in table.fields %}
    {% for key, value in field|castToArray %}
      {% if 'validators.' in value[0] and value[1] %}
        {% set validator = value[0][11:] %}
        {% include includeTemplate(['Fields' ~ field.data_type ~ validator ~ '.tpl']) %}
      {% endif %}
    {% endfor %}
  {% endfor %}

  {% for field in table.fields %}
    {% set fieldWithData = field | fieldData %}
    {% include includeTemplate(['Fields' ~ field.data_type ~'update.tpl', 'Fieldsupdate.tpl']) %}
  {% endfor %}
  
  // Create a {{ table.singleName | friendly }}
  const {{ table.singleName | friendly }} = new {{ table.name | friendly }}(updatedData)

  // Save {{ table.singleName | friendly }} in the database
  {{ table.singleName | friendly }}.save()
    .then(data => {
      exports.findOne({ ID: data._id, res: options.res })
    }).catch(err => {
      options.res.status(500).send({
        message: err.message || "Some error occurred while saving the record."
      })
    })
}

exports.createAsPromise = (options) => {
  return new Promise(async (resolve, reject) => {
    const data = options.req ? options.req.body : options.data
    const { errorMessages } = data
    const updatedData = {}
    if (data._id) updatedData._id = data._id
    
    {% for field in table.fields %}
      {% for key, value in field|castToArray %}
        {% if 'validators.' in value[0] and value[1] %}
          {% set validator = value[0][11:] %}
          {% include includeTemplate(['Fields' ~ field.data_type ~ validator ~ '.tpl']) %}
        {% endif %}
      {% endfor %}
    {% endfor %}

    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~'update.tpl', 'Fieldsupdate.tpl']) %}
    {% endfor %}
  
    // Create a {{ table.singleName | friendly }}
    const {{ table.singleName | friendly }} = new {{ table.name | friendly }}(updatedData)

    // Save {{ table.singleName | friendly }} in the database
    {{ table.singleName | friendly }}.save()
    .then(result => {
      if (options.skipfind) {
        resolve(result)
      } else {
        exports.findOne({ ID: result._id, res: options.res }).then(result => {
          resolve( result )
        })
      }
    })
    .catch((err) => {
      reject(errors.prepareError(err, errorMessages))
    })
  })
}

// Retrieve and return all {{ table.name | friendly }} from the database.
exports.findAll = (options) => {
  const query = options.query ? options.query : options.req.query
  if (typeof query.populate === 'undefined') query.populate = 'true'
  const data = options.req ? options.req.body : options.data
  if (typeof query.sort === 'string') query.sort = JSON.parse(query.sort)
  if (!query.sortLanguage) query.sortLanguage = 'en';

  const findString = {}
  if (query.fixedSearch) {
    query.fixedSearch = JSON.parse(query.fixedSearch)
    findString[query.fixedSearch.field] = { $regex: new RegExp(query.fixedSearch.value, 'i') }
  }

  {{ table.name | friendly }}.find(findString)
  .sort( query.sort && { [query.sort.field]: query.sort.method === 'desc' ? -1 : 1 })
  .collation({ locale: query.sortLanguage, strength: 1 })
   {% for field in table.fields %}
    {% set fieldWithData = field | fieldData %}
    {% include includeTemplate(['Fields' ~ field.data_type ~'find.tpl', 'Fieldsfind.tpl']) %}
  {% endfor %}
    .then({{ table.name | friendly | lower }} => {
      options.res.json(paginate.paginate({{ table.name | friendly | lower }}, { page: query.page, limit: query.limit || 10 }))
    }).catch(err => {
      options.res.status(500).send({
        message: err.message || "Some error occurred while retrieving records."
      })
    })
}

exports.find = (options) => {
  return new Promise((resolve, reject) => {
    const query = options.query ? options.query : options.req.query
    const data = options.req ? options.req.body : options.data
    let findString =  query.searchString ? { $text: { $search: query.searchString } } : {}
    if (query.searchField) {
      if ({{ table.name | friendly }}.schema.path(query.searchField)?.instance === 'Boolean') {
        findString = { [query.searchField]: JSON.parse(query.searchString) }
      } else if ({{ table.name | friendly }}.schema.path(query.searchField)?.instance === 'Date') {
        findString = { $expr: {$eq: [query.searchString, { $dateToString: {date: `$${query.searchField}`, format: "%Y-%m-%d"}}]}}
      } else {
        if (query.exactMatch) {
          findString = { [query.searchField]: query.searchString }
        } else {
          findString = { [query.searchField]: { $regex : new RegExp(query.searchString, "i") } }
        }      }
      
      if ({{ table.name | friendly }}.schema.path(query.searchField)?.instance === 'ObjectId' || {{ table.name | friendly }}.schema.path(query.searchField)?.instance === 'Array') {
        const ObjectID = require('mongoose').Types.ObjectId
        findString = { [query.searchField]: query.searchString ? new ObjectID(query.searchString) : null }
      }
    } else if (query.filters) {
      query.filters.forEach(filter => {
        const parsed = typeof filter === 'string' ? JSON.parse(filter) : filter
        findString[parsed.field] = parsed.value
      })
    }
    if (typeof query.sort === 'string') query.sort = JSON.parse(query.sort)
    if (!query.sortLanguage) query.sortLanguage = 'en';
    if (query.fixedSearch) {
      query.fixedSearch = JSON.parse(query.fixedSearch)
      findString[query.fixedSearch.field] = { $regex: new RegExp(query.fixedSearch.value, 'i') }
    }

    {{ table.name | friendly }}.find(findString)
    .sort( query.sort && { [query.sort.field]: query.sort.method === 'desc' ? -1 : 1 })
    .collation({ locale: query.sortLanguage, strength: 1 })
    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~'find.tpl', 'Fieldsfind.tpl']) %}
    {% endfor %}
      .then(({{ table.singleName | friendly | lower }}) => {
        resolve(paginate.paginate({{ table.singleName | friendly | lower }}, { page: query.page, limit: query.limit || 10 }))
      })
      .catch((err) => {
        options.res.status(500).send({
          message: err.message || 'Some error occurred while retrieving records.',
        })
      })
  })
}

// Find a single {{ table.singleName | friendly }} with a ID
exports.findOne = ( options ) => {
  return new Promise((resolve, reject) => {
    const query = { populate: 'true' }
    const id = options.req ? options.req.params.ID : options.ID
    {{ table.name | friendly }}.findById(id)
    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~'find.tpl', 'Fieldsfind.tpl']) %}
    {% endfor %}
      .then({{ table.singleName | friendly | lower }} => {
        if(!{{ table.singleName | friendly | lower }}) {
            return options.res.status(404).send({
              message: "{{ table.singleName | friendly }} not found with id " + id
            })     
        }
        resolve(paginate.paginate([{{ table.singleName | friendly | lower }}]))
      }).catch(err => {
        if(err.kind === 'ObjectId') {
          return options.res.status(404).send({
            message: "{{ table.singleName | friendly }} not found with id " + id
          })
        }
        return options.res.status(500).send({
          message: "Error retrieving {{ table.singleName | friendly }} with id " + id
        })
      })
  })
}

// Update a {{ table.singleName | friendly | lower }} identified by the ID in the request
exports.update = (options) => {
  return new Promise(async (resolve, reject) => {
    const id = options.req ? options.req.params.ID : options.ID
    const data = options.req ? options.req.body : options.data
    const updatedData = {}

    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~'update.tpl', 'Fieldsupdate.tpl']) %}
    {% endfor %}
    
    // Find {{ table.singleName }} and update it with the request body
    const query = { populate: 'true' }
    {{ table.name | friendly }}.findByIdAndUpdate(id, updatedData, {new: true})
    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~'find.tpl', 'Fieldsfind.tpl']) %}
    {% endfor %}
      .then(result => {
        resolve(result)
      }).catch(err => {
        reject(err)
      })
  })

  
}

// Delete a {{ table.singleName | friendly | lower }} with the specified ID in the request
exports.delete = (options) => {
  return new Promise((resolve, reject) => {
    const params = options.req ? options.req.params : options
    let theFilter = { '_id' : params.ID }
    
    if (options.queryString && options.queryField) {
      theFilter = { [options.queryField]: options.queryString }
    }
    {{ table.name | friendly }}.deleteMany(theFilter)
      .then((result) => {
        resolve(result)
      })
      .catch((e) => {
        reject(e)
      })
  })
}

