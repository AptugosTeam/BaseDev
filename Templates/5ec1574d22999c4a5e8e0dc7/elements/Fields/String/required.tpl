/*
path: required.tpl
type: file
unique_id: gIguXyTK
icon: file.svg
children: []
*/

// required validation
if(typeof data.{{ field.column_name | friendly }} !== 'undefined' && !data.{{ field.column_name | friendly }}) {
  options.res.status(422).send({ message: '{{ field.column_name }} requires a value', field: '{{ field.column_name | friendly }}' })
  return
}
