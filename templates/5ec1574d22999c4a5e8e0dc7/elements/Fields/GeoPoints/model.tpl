/*
path: model.tpl
type: file
unique_id: comput3C4
icon: ico-field
*/
{% set friendlyColumnName = field.column_name | friendly  %}
{{ friendlyColumnName }}: {
  type: {
    type: String,
    enum: ['Point'],
    required: true
  },
  coordinates: {
    type: [Number],
    required: true
  }
},