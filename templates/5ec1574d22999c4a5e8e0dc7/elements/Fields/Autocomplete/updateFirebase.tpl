/*
path: updateFirebase.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Autocomplete/updateFirebase.tpl
keyPath: elements/Fields/Autocomplete/updateFirebase.tpl
unique_id: 0W7xTXSM
*/
{% set friendlyColumnName = field.column_name | friendly %}
if (typeof data.{{ friendlyColumnName }} !== 'undefined') {
  try {
    const {{ reference.table.name | friendly }} = require('../models/{{ reference.table.name | friendly | lower }}.model.js')
    let Received{{ friendlyColumnName }} =  (typeof data.{{ friendlyColumnName }} === 'string') ? JSON.parse(data.{{ friendlyColumnName }}) : data.{{ friendlyColumnName }} 
    {{ friendlyColumnName }}info = Array.isArray(Received{{ friendlyColumnName }}) ? Received{{ friendlyColumnName }}[0] : Received{{ friendlyColumnName }}
  
    if (!{{ friendlyColumnName }}info._id) {
      const doc = await {{ reference.table.name | friendly }}.create({ {{ reference.column_name }}: {{ friendlyColumnName }}info.{{ reference.column_name }} }, true)
      updatedData['{{ friendlyColumnName }}'] = doc
    } else {
      const doc = await {{ reference.table.name | friendly }}.getById({{ friendlyColumnName }}info._id)
      {% set referencedField = field.referencekey | fieldData %}
      updatedData['{{ friendlyColumnName }}'] = doc['{{ referencedField.column_name }}']
    }
  } catch(e) {
    updatedData['{{ friendlyColumnName }}'] = data.{{ friendlyColumnName }}
  }
}