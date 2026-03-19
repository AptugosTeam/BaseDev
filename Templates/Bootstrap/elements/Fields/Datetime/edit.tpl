/*
path: edit.tpl
completePath: elements/Fields/Datetime/edit.tpl
unique_id: 4nRlZ33x
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextField
  {% if element.values.Autofocus %}autoFocus{% endif %}
  {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
  label={{ field.prompt|default(field.column_name)  | textOrVariable }}
  type="datetime-local"
  fullWidth
  step="900"
  value={ {{ tableName }}data.{{ field.column_name | friendly }} ? new Date(new Date({{ tableName }}data.{{ field.column_name | friendly }}).setMinutes(new Date({{ tableName }}data.{{ field.column_name | friendly }}).getMinutes() - new Date().getTimezoneOffset())).toISOString().slice(0,16) : '' }
  onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
  InputLabelProps={ {
    shrink: true,
  } }
/>


