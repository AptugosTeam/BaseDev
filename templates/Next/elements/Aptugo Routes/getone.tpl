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
    const result = await {{ tableName }}Model.findOneAndUpdate(
      { _id: req.query.ID }
    )
    res.status(201).json({ success: true, data: result })
  } catch (error) {
    res.status(400).json({ success: false, error: error.toString() })
  }
}