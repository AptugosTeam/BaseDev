/*
path: delete.tpl
type: file
unique_id: z1DSB2ab
icon: ico-field
children: []
*/
async (req, res) => {
  const _id = req.query.ID
  {% if table.beforeDelete %}{{ table.beforeDelete }}{% endif %}
  const {{ singleName }} = await delete{{ singleName }}ById(req.db, _id)
  res.json({ {{ singleName }} })
}