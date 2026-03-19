/*
path: required.tpl
type: file
unique_id: NSdDLMfm
icon: ico-field
*/
// required validation for date
if(typeof data.{{ field.column_name | friendly }} !== 'undefined' && !data.{{ field.column_name | friendly }}) {
  options.res.status(422).send({ message: '{{ field.column_name }} requires a value', field: '{{ field.column_name | friendly }}' })
  return
}