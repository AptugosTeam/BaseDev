/*
path: update.tpl
completePath: elements/Fields/Autocomplete/update.tpl
unique_id: zd6mrTlU
*/
{% set reference = field.reference | fieldData %}
{% set fieldInfo = field | fieldData %}
{% set columnName = field.column_name | friendly %}
{% set referencedTableName = reference.table.name | friendly %}
{% if fieldInfo.table.subtype == 'Firebase' %}
  {% include includeTemplate('updateFirebase.tpl') %}
{% else %}
{% if field.relationshipType == 'm:1' %}
  if (data.{{ columnName }} === 'null') data.{{ columnName }} = null
  updatedData['{{ columnName }}'] = {}
  try {
    const {{ referencedTableName }} = require('../models/{{ reference.table.name | friendly | lower }}.model.js')
    let Received{{ columnName }} =  (typeof data.{{ columnName }} === 'string') ? JSON.parse(data.{{ columnName }}) : data.{{ columnName }} 
    {{ columnName }}info = Array.isArray(Received{{ columnName }}) ? Received{{ columnName }}[0] : Received{{ columnName }}
    
    if (!{{ columnName }}info._id) {
      const mongoose = require('mongoose')
      const {{ columnName }}ID = new mongoose.Types.ObjectId()
      const {{ reference.table.singleName | friendly }} = new {{ referencedTableName }}({ ...{{ columnName }}info, _id: {{ columnName }}ID })          
      {{ reference.table.singleName | friendly }}.save()
      updatedData['{{ columnName }}'] = {{ columnName }}ID
    } else {
      updatedData['{{ columnName }}'] = {{ columnName }}info._id
    }  
  } catch (e) {
    updatedData['{{ columnName }}'] = data.{{ columnName }}
  }
{% elseif field.relationshipType == '1:1' %}
  updatedData['{{ columnName }}'] = {}
  try {
    const {{ referencedTableName }}Controller = require('./{{ reference.table.name | friendly | lower }}.controller.js')
    let Received{{ columnName }} =  (typeof data.{{ columnName }} === 'string') ? JSON.parse(data.{{ columnName }}) : data.{{ columnName }} 
    {{ columnName }}info = Array.isArray(Received{{ columnName }}) ? Received{{ columnName }}[0] : Received{{ columnName }}
    if (!{{ columnName }}info._id) {
      const mongoose = require('mongoose')
      const {{ columnName }}ID = new mongoose.Types.ObjectId()
      {{ referencedTableName }}Controller.createAsPromise({ data: { ...{{ columnName }}info, _id: {{ columnName }}ID }})
      updatedData['{{ columnName }}'] = {{ columnName }}ID
    } else {
      {{ referencedTableName }}Controller.update({ ID: {{ columnName }}info._id, data: {{ columnName }}info})
      updatedData['{{ columnName }}'] = {{ columnName }}info._id
    }
  } catch (e) {
    updatedData['{{ columnName }}'] = data.{{ columnName }}
  }
{% else %}
  updatedData['{{ columnName }}'] = []
  try {
    const {{ referencedTableName }} = require('../controllers/{{ reference.table.name | friendly | lower }}.controller.js')
    let Received{{ columnName }} =  (typeof data.{{ columnName }} === 'string') ? JSON.parse(data.{{ columnName }}) : data.{{ columnName }} 
    {{ columnName }}Raw = Array.isArray(Received{{ columnName }}) ? Received{{ columnName }} : [Received{{ columnName }}]
    for await (const {{ columnName }}info of {{ columnName }}Raw) {
      const {{ columnName }}Files = {}
      {% if reference.data_type == 'Image' %}
      if ({{ columnName }}info && {{ columnName }}info.data) {
        if (!fs.existsSync(`${options.req.app.get('filesFolder')}`)) fs.mkdirSync(`${options.req.app.get('filesFolder')}`, { recursive: true })
        fs.writeFileSync(`${options.req.app.get('filesFolder')}/${ {{ columnName }}info.name}`, {{ columnName }}info.data)
        {{ columnName }}info.{{ reference.column_name | friendly }} = {{ columnName }}info.name
      }
      {% endif %}

      if (!{{ columnName }}info._id) {
        const mongoose = require('mongoose')
        let {{ columnName }}ID = new mongoose.Types.ObjectId()

        Object.keys({{ columnName }}info).forEach(info => {
          if ({{ columnName }}info[info] && typeof {{ columnName }}info[info] === 'object' && (typeof {{ columnName }}info[info].{{ reference.column_name }} === 'string' || typeof {{ columnName }}info.{{ reference.column_name }} === 'string')) {
            {{ columnName }}Files[info] = {{ columnName }}info[info]
          }
        })

        let req = options.req || {}
        req.body = { ...{{ columnName }}info, _id: {{ columnName }}ID }
        req.files = { ...{{ columnName }}Files }
        try {
          const result = await {{ referencedTableName }}.createAsPromise({ req, res: options.res })
        } catch(e) {
          if (e.code === 422) {
            const duplicateError = await {{ referencedTableName }}.find({ query: { searchField: e.field, searchString: {{ columnName }}info[e.field] }})
            ContactsID = duplicateError.docs[0]._id
          }
        }
        
        updatedData['{{ columnName }}'].push({{ columnName }}ID)
      } else {
        {{ referencedTableName }}.update({ ID: {{ columnName }}info._id, data: {{ columnName }}info })
        updatedData['{{ columnName }}'].push({{ columnName }}info._id)
      }
    }
  } catch(e) {
      updatedData['{{ columnName }}'] = data.{{ columnName }}
  }
{% endif %}
{% endif %}