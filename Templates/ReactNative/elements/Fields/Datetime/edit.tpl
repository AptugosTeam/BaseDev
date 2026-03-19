/*
path: edit.tpl
completePath: elements/Fields/Datetime/edit.tpl
unique_id: 4nRlZ33x
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import { TextInput } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextInput
  {% if element.values.Autofocus %}autoFocus{% endif %}
  {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
  label={{ field.prompt|default(field.column_name)  | textOrVariable }}
  type="datetime-local"
  fullWidth
  value={ {{ tableName }}data.{{ field.column_name | friendly }}?.slice(0,16) || '' }
  onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
  InputLabelProps={ {
    shrink: true,
  } }
/>
