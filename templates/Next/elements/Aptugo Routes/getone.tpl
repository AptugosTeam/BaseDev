/*
path: getone.tpl
type: file
unique_id: qQA9SMGy
icon: ico-field
children: []
*/
async (req, res) => {
  {% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
  const article = await findarticleById(req.db, req.query.ID)
  res.json(article)
}