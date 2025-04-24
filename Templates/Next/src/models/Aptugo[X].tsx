/*
path: "{{ table.name |\_friendly }}.tsx"
type: file
unique_id: gmodelURo
icon: ico-field
modelRelated: true
sourceType: javascript
subtype: Aptugo
children: []
*/
{% set tableName = table.name | friendly %}
{% set singleName = table.singleName | friendly %}
import mongoose from "mongoose"
import paginate from 'mongoose-aggregate-paginate-v2'
{{ insert_setting('modelAddenumHead') | raw }}

{% set extraImports = '' %}
{% set extraPlugins = '' %}
{% set modelDefinition %}
  export interface {{ tableName }} extends mongoose.Document {
    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% set type = field.data_type | lower %}
      {% set fieldWithData = field | fieldData %}
      {% if fieldWithData.options.frontEndType %}{% set type = fieldWithData.options.frontEndType %}
      {% elseif fieldWithData.extraOptions.frontEndType %}{% set type = fieldWithData.extraOptions.frontEndType %}
      {% endif %}
      {{ field.column_name | friendly }}: {{ type }}
    {% endfor %}
  }

  const {{ singleName }}Schema = new mongoose.Schema<{{ tableName }}>({
    {% for field in table.fields %}
      {% set fieldInfo = field | fieldData %}
      {% set output = {
        rawString: '',
        fieldInfo: fieldInfo,
        extraImports: extraImports,
        extraPlugins: extraPlugins
      }%}
      {% set data %}{% include includeTemplate(['Fields' ~ field.data_type ~ 'model.tpl', 'Fieldsmodel.tpl']) %}{% endset %}
      {% set output = (data|json_decode) ?? data %}

      {% if output.extraImports and output.extraImports not in extraImports %}
        {% set extraImports = extraImports ~ output.extraImports %}
      {% endif %}
      {% if output.extraPlugins and output.extraPlugins not in extraPlugins %}
        {% set extraPlugins = extraPlugins ~ output.extraPlugins %}
      {% endif %}
      {{ output.rawString ?? data }}
    {% endfor %}
  }, {
    timestamps: true,
    toJSON: { virtuals: true },
    toObject: { virtuals: true }
  })
{% endset %}

{{ extraImports }}
{{ modelDefinition }}

{{ singleName }}Schema.plugin(paginate)
{{ extraPlugins }}

{% for relatedField in builder.plainFields %}
  {% if relatedField.reference %}
    {% set relData = relatedField.reference | fieldData %}
    {% if relatedField.relationshipType != '1:m' and table.unique_id == relData.table.unique_id %}
      {% set foundFieldData = relatedField | fieldData %}
      {% set virtualName = (foundFieldData.table.name | friendly) ~ foundFieldData.column_name %}
      {{ singleName }}Schema.virtual('{{ virtualName }}', {
        ref: '{{ foundFieldData.table.name | friendly }}',
        localField: '_id',
        foreignField: '{{ foundFieldData.column_name }}',
        justOne: {% if relatedField.relationshipType == '1:1' %}true{% else %}false{% endif %},
        type: '{{ relData.relationshipType }}'
      })
    {% endif %}
  {% endif %}
{% endfor %}

export default mongoose.models.{{ tableName }} as mongoose.AggregatePaginateModel<{{ tableName }}> || mongoose.model<{{ tableName }}, mongoose.AggregatePaginateModel<{{ tableName }}>>('{{ tableName }}', {{ singleName }}Schema, '{{ tableName }}')
