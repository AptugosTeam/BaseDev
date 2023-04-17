/*
path: btngroup.tpl
type: file
unique_id: dKPTPUtZ
icon: ico-field
sourceType: javascript
children: []
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import FormControlLabel from '@mui/material/FormControlLabel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import Button from '@mui/material/Button'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import ButtonGroup from '@mui/material/ButtonGroup'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<FormControlLabel
  label={{ field.prompt|default(field.column_name)  | textOrVariable }}
  control={<ButtonGroup color="primary" aria-label="outlined primary button group">
    {% for item in field.options|split(';') %}
    <Button
      disableElevation
      variant={ {{ tableName }}data.{{ field.column_name | friendly }} === '{{ item }}' ? 'contained':'outlined'} 
      key="{{ item }}"
      value="{{ item }}"
      onClickCapture={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
    >{{ item }}</Button>
    {% endfor %}
  </ButtonGroup>}
  {% if element.values.Autofocus %}autoFocus{% endif %}
  {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
/>



