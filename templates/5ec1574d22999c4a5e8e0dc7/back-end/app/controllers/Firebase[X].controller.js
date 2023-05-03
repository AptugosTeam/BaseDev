/*
path: "{{ table.name |\_friendly |\_lower }}.controller.js"
type: file
unique_id: gSp3dUFB
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Firebase
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
exports.createAsPromise = (options) => {
  return new Promise(async (resolve, reject) => {
    const data = options.req ? options.req.body : options.data
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
  
    // Save {{ table.singleName | friendly }} in the database
    {{ table.name | friendly }}.create(updatedData).then((result) => {
      if (options.skipfind) {
        resolve(result)
      } else {
        exports.findOne({ ID: result, res: options.res }).then((result) => {
          resolve(result)
        })
      }
    }).catch((err) => {
      reject(errors.prepareError(err))
    })
  })
}

// Retrieve and return all {{ table.name | friendly }} from the database.
exports.findAll = (options) => {
  const query = options.query ? options.query : options.req.query
  if (typeof query.populate === 'undefined') query.populate = 'true'
  const data = options.req ? options.req.body : options.data
  if (typeof query.sort === 'string') query.sort = JSON.parse(query.sort)

  const findString = {}
  if (query.fixedSearch) {
    query.fixedSearch = JSON.parse(query.fixedSearch)
    findString[query.fixedSearch.field] = { $regex: new RegExp(query.fixedSearch.value, 'i') }
  }

  {{ table.name | friendly }}
    .find({ limit: query.limit || 10, page: query.page || 1 })
    .then({{ table.name | friendly | lower }} => {
      options.res.json({{ table.name | friendly | lower }})
    }).catch(err => {
      options.res.status(500).send({
        message: err.message || "Some error occurred while retrieving records."
      })
    })
}

exports.find = (options) => {
  return new Promise((resolve, reject) => {
    const query = options.query ? options.query : options.req.query
    {{ table.name | friendly }}.search(query.searchField, query.searchString).then(result => {
      resolve(result)
    }).catch(e => {
      reject(e)
    })
  })
}

// Find a single {{ table.singleName | friendly }} with a ID
exports.findOne = ( options ) => {
  return new Promise((resolve, reject) => {
    const query = { populate: 'true' }
    const id = options.req ? options.req.params.ID : options.ID
    {{ table.name | friendly }}.getById(id)
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
    {{ table.name | friendly }}
      .updateById( id, updatedData)
      .then(result => {
        resolve({ _id: id, ...updatedData })
      })
      .catch(err => {
        reject(err)
      })
  })

  
}

// Delete a {{ table.singleName | friendly | lower }} with the specified ID in the request
exports.delete = (options) => {
  return new Promise((resolve, reject) => {
    const params = options.req ? options.req.params : options
    {{ table.name | friendly }}.deleteById(params.ID).then(result => {
      resolve(result)
    }).catch(e => {
      reject(e)
    })
  })
}

