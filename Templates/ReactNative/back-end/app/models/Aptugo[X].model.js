/*
path: "{{ table.name |\_friendly |\_lower }}.model.js"
type: file
unique_id: fnd3TqFu
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/
{% set friendlyTableName = table.name | friendly %}
{% set schema = '' %}
{% set extraImports = '' %}
{% set extraPlugins = '' %}
  
const mongoose = require('mongoose')
const mongoosePaginate = require('mongoose-paginate-v2')
{{ extraImports }}
const {{ friendlyTableName }}Schema = mongoose.Schema({
  {% for field in table.fields %}
    {% set fieldInfo = field | fieldData %}
    {% include includeTemplate(['Fields' ~ field.data_type ~ 'model.tpl', 'Fieldsmodel.tpl']) with { fieldInfo: fieldInfo} %}
  {% endfor %}
}, {
    timestamps: true,
    toJSON: { virtuals: true }
})

{% for relatedField in builder.plainFields %}
  {% if relatedField.reference %}
    {% set relData = relatedField.reference | fieldData %}
    {% if relatedField.data_type == 'Relationship' and (relatedField | fieldData).table.unique_id == table.unique_id %}
        {{ table.name | friendly }}Schema.add({ {{ relData.table.name }}: [ require('./{{ relData.table.name | lower }}.model.js').schema ] })
    {% else %}
      {% if relatedField.relationshipType != '1:m' and table.unique_id == relData.table.unique_id %}
        {% set foundFieldData = relatedField | fieldData %}
        {{ table.name | friendly }}Schema.virtual('{{ foundFieldData.table.name | friendly }}', {
          ref: '{{ foundFieldData.table.name | friendly }}',
          localField: '_id',
          foreignField: '{{ foundFieldData.column_name }}',
          justOne: {% if relatedField.relationshipType == '1:1' %}true{% else %}false{% endif %},
          type: '{{ relData.relationshipType }}'
        })
      {% endif %}
    {% endif %}
  {% endif %}
{% endfor %}

{{ extraPlugins }}
{{ insert_setting('schema' ~ friendlyTableName) | raw }}
{{ friendlyTableName }}Schema.plugin(mongoosePaginate)
{{ friendlyTableName }}Schema.index(
  {
  {% for field in table.fields %}
    {{ field.column_name | friendly }}: 'text',
  {% endfor %} 
  }
);

const myModel = module.exports = mongoose.model('{{ table.name | friendly }}', {{ table.name | friendly }}Schema, '{{ table.name | friendly | lower }}')
myModel.schema = {{ table.name | friendly }}Schema
