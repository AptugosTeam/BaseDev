/*
path: update.tpl
completePath: elements/Aptugo Routes/update.tpl
unique_id: h3MzGmRq
*/
{% if table.beforeUpdate %}
  (req, _res, next) => {
    {{ table.beforeUpdate }}
    next()
  },
{% endif %}
async (req, res) => {
  try {
    {{ insert_setting(singleName ~ '_Pre_Update') | raw }}

    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~'update.tpl', 'Fieldsupdate.tpl']) %}
    {% endfor %}

    const result = await {{ tableName }}Model.findOneAndUpdate({ _id: req.query.ID }, { {% for field in table.fields %}{{ field.column_name | friendly }},{% endfor %} }, {
      new: true
    })
    res.status(201).json({ success: true, data: result })
  } catch(error) {
    res.status(400).json({ success: false, error: error.toString() })
  }
}