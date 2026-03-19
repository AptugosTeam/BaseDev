/*
path: add.tpl
type: file
unique_id: fzm5tmGI
icon: ico-field
children: []
*/
{% if table.beforeCreate %}
  (req, _res, next) => {
    {{ table.beforeCreate }}
    next()
  },
{% endif %}
async (req, res) => {
  try {
    {{ insert_setting(singleName ~ '_Pre_Add') | raw }}

    {% for field in table.fields %}
      {% set fieldWithData = field | fieldData %}
      {% include includeTemplate(['Fields' ~ field.data_type ~'update.tpl', 'Fieldsupdate.tpl']) %}
    {% endfor %}

    const newRecord = new {{ tableName }}Model({ {% for field in table.fields %}{{ field.column_name | friendly }},{% endfor %} })
    const result = await newRecord.save()
    res.status(201).json({ success: true, data: result })
  } catch(error) {
    res.status(400).json({ success: false, error: error.toString() })
  }
}