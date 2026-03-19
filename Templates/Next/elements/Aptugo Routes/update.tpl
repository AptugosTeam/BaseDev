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
    {{ field.column_name | friendly | lower }}: ValidateProps.{{ singleName}}.{{ field.column_name | friendly | lower }},
    {% endfor %}
  },
}),
async (req, res) => {
  const {
    {% for field in table.fields %}
      {{ field.column_name | friendly | lower }},
    {% endfor %}
  } = req.body
  const {{ tableName }} = await update{{ singleName }}ById(req.db, req.query.ID, {
    {% for field in table.fields %}
      {{ field.column_name | friendly | lower }},
    {% endfor %}
  })

  res.json({ {{ tableName }} })
}