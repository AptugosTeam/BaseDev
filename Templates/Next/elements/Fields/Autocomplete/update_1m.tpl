/*
path: update_1m.tpl
completePath: elements/Fields/Autocomplete/update_1m.tpl
unique_id: zd6mrTlU1m
*/
{% set columnName = field.column_name | friendly %}
if(typeof fields.{{ columnName }} !== 'undefined') {
  {{ singleName }}.{{ columnName }} = []
  for await (const {{ columnName }}info of fields.{{ columnName }}) {
    {{ singleName }}.{{ columnName }}.push( new ObjectId({{ columnName }}info._id) )
  }
}
