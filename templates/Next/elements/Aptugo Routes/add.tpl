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
    {{ field.column_name | friendly }}: ValidateProps.{{ singleName }}.{{ field.column_name | friendly }},
    {% endfor %}
  },
}),
async (req, res) => {
  {% set settingName =  singleName ~ '_Pre_Add' %}
  {{ insert_setting(settingName) | raw }}
  const {{ singleName }} = await insert{{ singleName }}(req.db, {
    {% for field in table.fields %}
      {{ field.column_name | friendly }}: req.body.{{ field.column_name | friendly }},
    {% endfor %}
  })
  return res.json({ {{ singleName }} })
}