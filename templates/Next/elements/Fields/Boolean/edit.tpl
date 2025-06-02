/*
path: edit.tpl
completePath: elements/Fields/Boolean/edit.tpl
unique_id: WQPUIqHm
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set fieldValue = tableName ~ 'data.' ~ theField.column_name | friendly %}
  {% if element.values.alternativeValue %}
    {% set fieldValue = element.values.alternativeValue %}
  {% endif %}
  {% set saveValue = '(e) => { handle' ~ tableName ~ 'Change("' ~ theField.column_name | friendly ~ '")(e.currentTarget.checked) }' %}
  {% if element.values.alternativeSaveMethod %}
    {% set saveValue = element.values.alternativeSaveMethod | functionOrCall %}
  {% endif %}
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
      checked={ {{ fieldValue }} }
      color="primary"
      onChange={ {{ saveValue }} }
    />}
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
/>