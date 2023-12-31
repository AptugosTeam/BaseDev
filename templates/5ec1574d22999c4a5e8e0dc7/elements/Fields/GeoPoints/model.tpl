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
  },
  coordinates: { type: [Number], index: '2dsphere', sparse: true, default: null }
},