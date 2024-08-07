/*
path: datatable.tpl
completePath: >-
  /Users/max/Aptugo/BaseDev/Templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Number/datatable.tpl
keyPath: elements/Fields/Number/datatable.tpl
unique_id: Uf65zU5B
settings:
  - name: Packages
    value: |-
      "react-number-format": "5.4.0",
*/
{% set bpr %}
import { NumericFormat } from 'react-number-format'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{ id: '{{ field.column_name | friendly | lower }}', header: '{{ field.displaylabel|default(field.column_name) }}', type: 'string', size: 300, renderValue: (cell) => { 
  return cell.getValue() ? <NumericFormat 
    value= { cell.getValue() }
    displayType="text"
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
  /> : '---'} },

