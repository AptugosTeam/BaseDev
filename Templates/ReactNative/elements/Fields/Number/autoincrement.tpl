/*
path: autoincrement.tpl
type: file
unique_id: gIguXyTL
icon: file.svg
children: []
*/
// autoincrement validation
{% set friendlyTableName = table.name | friendly %}
{% set friendlyFieldName = field.column_name | friendly %}
{% set savedValidation %}
{{ friendlyTableName }}Schema.pre('save', function (next) {
  var tat = this
  if (!this.isNew) return;
  myModel.find({}).sort({"{{ friendlyFieldName }}" : -1}).limit(1).exec(function(err, doc) {
    if (typeof doc[0].{{ friendlyFieldName }} === 'undefined') {
      tat.{{ friendlyFieldName }} = 1
    } else {
      tat.{{ friendlyFieldName }} = doc[0].{{ friendlyFieldName }} + 1
    }
    next()
  })
})
{% endset %}
{{ add_setting( 'schema' ~ friendlyTableName  , savedValidation) }}

