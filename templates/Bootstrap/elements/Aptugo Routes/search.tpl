/*
path: search.tpl
type: file
unique_id: 36m5BEAd
icon: ico-field
children: []
*/
{% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
{{ table.name | friendly | lower }}.find({ req, res }).then((result) => {
  res.send(result)
})