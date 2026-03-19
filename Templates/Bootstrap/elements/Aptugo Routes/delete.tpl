/*
path: delete.tpl
type: file
unique_id: z1DSB2ab
icon: ico-field
children: []
*/
{% if table.beforeDelete %}{{ table.beforeDelete }}{% endif %}
{{ table.name | friendly | lower }}.delete({ req, res })
  .then(result => {
    res.send(result)
  })
  .catch(e => {
    res.status(500).send(e)
  })

