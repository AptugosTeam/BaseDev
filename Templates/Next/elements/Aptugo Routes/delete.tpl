/*
path: delete.tpl
type: file
unique_id: z1DSB2ab
icon: ico-field
children: []
*/
async (req, res) => {
  {% if table.beforeDelete %}{{ table.beforeDelete }}{% endif %}
  try {
    const _id = req.query.ID
    await {{ tableName }}Model.deleteOne({ _id: req.query.ID })
    res.status(201).json({ success: true })
  } catch (error) {
    res.status(400).json({ success: false, error: error.toString() })
  }
}