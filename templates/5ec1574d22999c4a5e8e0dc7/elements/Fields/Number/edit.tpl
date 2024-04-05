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
    {% if field.minLimit %}
      value={ {{ tableName }}data.{{ field.column_name | friendly }} || {{ field.minLimit }} }
    {% else %}
      value={ {{ tableName }}data.{{ field.column_name | friendly }} || {{ field.defaultValue }} }
    {% endif %}
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    fullWidth
    className={ {% if element.values.classname %}{{ element.values.classname }}{% else %}'field_{{ field.column_name | friendly }}'{% endif %}}
    {% if field.decimalScale %}
      decimalScale={ {{ field.decimalScale }} }
    {% elseif field.decimalScale == 0 %}
      decimalScale={0}
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
          {% if field.minLimit %}
            const MIN_LIMIT = {{ field.minLimit }}
          {% endif %}
          const MAX_LIMIT = {{ field.isAllowed | raw }}
          const { floatValue } = values
          {% if field.minLimit %}
            return floatValue === undefined || floatValue === null || (floatValue >= MIN_LIMIT && floatValue <= MAX_LIMIT)
          {% else %}
            return floatValue === undefined || floatValue === null || floatValue <= MAX_LIMIT
          {% endif %}
        }} 
    {% endif %}
    {% if field.allowNegative == "false" %}
      allowNegative={false}
    {% endif %}
    customInput={TextField}
    onValueChange={(values, sourceInfo) => {
    {% if field.minLimit %}
      handle{{ tableName }}Change("{{ field.column_name | friendly }}")(values.floatValue || {{ field.minLimit }})
    {% else %}
      handle{{ tableName }}Change("{{ field.column_name | friendly }}")(values.floatValue || 0)
    {% endif %}
    }}
    {...{{ field.column_name | friendly }}TextFieldProps}
/>
