/*
path: update.tpl
completePath: elements/Aptugo Routes/update.tpl
unique_id: h3MzGmRq
*/
async (req, res, next) => {
  {% if table.beforeUpdate %}{{ table.beforeUpdate }}{% endif %}
  next()
},
validateBody({
  type: "object",
  properties: {
    {% for field in table.fields %}
    {{ field.column_name | friendly }}: ValidateProps.{{ singleName }}.{{ field.column_name | friendly }},
    {% endfor %}
  },
}),
async (req, res) => {
  {% set settingName = singleName ~ '_Pre_Update' %}
  {{ insert_setting(settingName) | raw }}

  const {
    {% for field in table.fields %}
      {{ field.column_name | friendly }},
    {% endfor %}
  } = req.body
  const {{ tableName }} = await update{{ singleName }}ById(req.db, req.query.ID, {
    {% for field in table.fields %}
      {{ field.column_name | friendly }},
    {% endfor %}
  })

  res.json({ {{ tableName }} })
}