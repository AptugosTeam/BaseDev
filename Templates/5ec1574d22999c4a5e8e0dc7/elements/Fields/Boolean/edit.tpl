/*
path: edit.tpl
completePath: elements/Fields/Boolean/edit.tpl
unique_id: WQPUIqHm
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import Checkbox from '@mui/material/Checkbox'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import FormControlLabel from '@mui/material/FormControlLabel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FormControlLabel
    control={<Checkbox 
      checked={ {{ tableName }}data.{{ field.column_name | friendly }} }
      color="primary"
      onChange={(e) => handle{{ tableName }}Change("{{ field.column_name | friendly }}")(e.currentTarget.checked)}
    />}
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
/>