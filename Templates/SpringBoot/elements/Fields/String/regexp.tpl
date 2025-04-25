/*
path: regexp.tpl
type: file
unique_id: gFFuXyTK
icon: file.svg
children: []
*/

// Regexp Validation
if (data.{{ field.column_name | friendly }}) {
  if (!/{{ attribute(field, 'validators.regexp') }}/.test(data.{{ field.column_name | friendly }} )) {
    options.res.status(422).send({ message: '{{ field.column_name | friendly }} must be specific formated', field: '{{ field.column_name | friendly }}' })
    return
  }
}