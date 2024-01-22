/*
path: add.tpl
type: file
unique_id: fzm5tmGI
icon: ico-field
children: []
*/
(req, _res, next) => {
  {% if table.beforeCreate %}{{ table.beforeCreate }}{% endif %}
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
  const {{ singleName }} = await insert{{ singleName }}(req.db, {
    {% for field in table.fields %}
      {{ field.column_name | friendly | lower }}: req.body.{{ field.column_name | friendly | lower }},
    {% endfor %}
  })
  return res.json({ {{ singleName }} })
}