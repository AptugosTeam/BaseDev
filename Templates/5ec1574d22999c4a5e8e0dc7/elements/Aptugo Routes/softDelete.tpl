/*
path: softDelete.tpl
type: file
unique_id: x2FDN3ab
icon: ico-field
children: []
*/
{% if table.beforeDelete %}{{ table.beforeDelete }}{% endif %}
{{ table.name | friendly | lower }}.softDelete({ req, res })
  .then(result => {
    res.send(result)
  })
  .catch(e => {
    res.status(500).send(e)
  })