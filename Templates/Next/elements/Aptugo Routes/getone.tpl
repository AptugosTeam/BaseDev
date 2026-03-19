/*
path: getone.tpl
type: file
unique_id: qQA9SMGy
icon: ico-field
children: []
*/
async (req, res) => {
  {% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
  const {{ singleName }} = await find{{ singleName }}ById(req.db, req.query.ID)
  res.json({{ singleName }})
}