/*
path: add.tpl
type: file
unique_id: fzm5tmGI
icon: ico-field
children: []
*/
{% if table.beforeCreate %}{{ table.beforeCreate }}{% endif %}
{{ table.name | friendly | lower }}.createAsPromise({ req, res })
  .then(result => {
    res.send(result)
  })
  .catch(e => {
    res.status(e.code || 500).send(e)
  })
