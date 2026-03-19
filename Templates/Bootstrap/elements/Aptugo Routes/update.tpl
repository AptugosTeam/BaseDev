/*
path: update.tpl
completePath: elements/Aptugo Routes/update.tpl
unique_id: h3MzGmRq
*/
{% if table.beforeUpdate %}{{ table.beforeUpdate }}{% endif %}
{{ table.name | friendly | lower }}.update({ req, res })
  .then(result => {
    res.send(result)
  })
  .catch(e => {
    res.status(500).send(e)
  })
