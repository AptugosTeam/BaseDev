/*
path: edit.tpl
type: file
unique_id: 5XT4GTP7
icon: file.svg
*/
{% set bpr %}
import FormControlLabel from '@mui/material/FormControlLabel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import Rating from '@mui/material/Rating';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FormControlLabel
    control={<Rating
  value={ {{ tableName }}data.{{ field.column_name | friendly }} || '' }
  onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
 />}
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
/>
