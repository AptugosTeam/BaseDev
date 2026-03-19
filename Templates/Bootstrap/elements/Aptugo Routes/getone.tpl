/*
path: getone.tpl
type: file
unique_id: qQA9SMGy
icon: ico-field
children: []
*/
{% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
{{ table.name | friendly | lower }}.findOne({ req, res }).then((result) => {
  res.send(result)
})
