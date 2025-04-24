/*
path: update.tpl
completePath: elements/Fields/Autocomplete/update.tpl
unique_id: zd6mrTlU
*/
{% set referencedField = field.reference | fieldData %}
{% set fieldInfo = field | fieldData %}
{% set bpr %}
  import { {{ referencedField.table.name | friendly }}Model } from '@/models'
{% endset %}
{{ add_setting((fieldInfo.table.singleName | friendly | lower) ~ '_File_Start', bpr) }}
{% if field.relationshipType == '1:m' %}
  if( typeof req.body.{{ field.column_name | friendly }} !== 'undefined' ) {
    var { {{ field.column_name | friendly }} } = req.body

    {{ field.column_name | friendly }} = {{ field.column_name | friendly }}.map(c => {
      if (c && c._id === null) {
        delete c._id
        c = new {{ referencedField.table.name | friendly }}Model(c)
        c.save()
      } else {
        c = c._id
      }
      return c
    })
  }
{% else %}
  if( typeof req.body.{{ field.column_name | friendly }} !== 'undefined' ) {
    var { {{ field.column_name | friendly }} } = req.body
    if ({{ field.column_name | friendly }} && {{ field.column_name | friendly }}._id === null) {
        delete {{ field.column_name | friendly }}._id
        {{ field.column_name | friendly }} = await new {{ referencedField.table.name | friendly }}Model({{ field.column_name | friendly }})
        {{ field.column_name | friendly }}.save()
      }
  }
{% endif %}
