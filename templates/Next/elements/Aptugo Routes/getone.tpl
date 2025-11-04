/*
path: getone.tpl
type: file
unique_id: qQA9SMGy
icon: ico-field
children: []
*/
async (req, res) => {
  {% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
  try {
    const result = await {{ tableName }}Model.find({ _id: req.query.ID })
    if (result.length === 0) res.status(404).json({ success: false, error: '{{ table.singleName }} record not Found' })
    else res.status(200).json({ success: true, data: result[0] })
  } catch (error) {
    res.status(500).json({ success: false, error: error.toString() })
  }
}