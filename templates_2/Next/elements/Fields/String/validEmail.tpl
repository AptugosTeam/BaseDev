/*
path: validEmail.tpl
type: file
unique_id: rusoWasHere
icon: file.svg
children: []
*/
// Valid Email Validation
if (data.{{ field.column_name | friendly }}) {
  if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(data.{{ field.column_name | friendly }} )) {
    options.res.status(422).send({ message: '{{ field.column_name | friendly }} must be specific formated', field: '{{ field.column_name | friendly }}' })
    return
  }
}
