/*
path: edit.tpl
completePath: elements/Fields/Number/edit.tpl
unique_id: iTMTweVR
settings:
  - name: Packages
    value: |-
      "react-number-format": "5.2.0",
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import TextField from '@mui/material/TextField'
import { NumericFormat } from 'react-number-format'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
  const {{ field.column_name | friendly }}TextFieldProps = {
    id: "filled-multiline-flexible",
    {% if element.values.DisableUnderline %}
        InputProps: { disableUnderline: true },
    {% endif %}
    {% if element.values.Autofocus %}autoFocus,{% endif %}
    {% if element.values.DisableVariable %}disabled: {{ element.values.DisableVariable | raw }} ,{% endif %}
    {% if field.placeholder %}placeholder: {{ field.placeholder | textOrVariable }},{% endif %}
    margin: '{{ element.values.margin|default("dense") }}',
    size: '{{ element.values.size|default("medium") }}',
    type: "number",
    multiline: true,
    maxRows: 4,
    variant: "{{ element.values.variant|default('standard') }}",
  };
{% endset %}
{{ save_delayed('ph',ph) }}
<NumericFormat 
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || 0 }
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    fullWidth
    className={ {% if element.values.classname %}{{ element.values.classname }}{% else %}'field_{{ field.column_name | friendly }}'{% endif %}}
    {% if field.decimalScale %}
      decimalScale={ {{ field.decimalScale }} }
    {% endif %}
    {% if field.formatNumber == "dotComma" %}
        thousandSeparator="."
        decimalSeparator=","
        {% elseif field.formatNumber == "commaDot" %}
          thousandSeparator=","
          decimalSeparator="."
        {% else %}
          decimalSeparator=","
    {% endif %}
        {% if field.isAllowed %}
        isAllowed=  {(values) => {
          const MAX_LIMIT = {{ field.isAllowed | raw }};
          const { floatValue } = values;
          return floatValue === undefined || floatValue <= MAX_LIMIT;
        }} 
    {% endif %}
    {% if field.allowNegative == "false" %}
      allowNegative={false}
    {% endif %}
    customInput={TextField}
    onValueChange={(values, sourceInfo) => {
      handle{{ tableName }}Change("{{ field.column_name | friendly }}")(values.floatValue || 0)
    }}
    {...{{ field.column_name | friendly }}TextFieldProps}
/>
