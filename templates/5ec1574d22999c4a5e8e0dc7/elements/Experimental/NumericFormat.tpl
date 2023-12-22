/*
path: NumericFormat.tpl
completePath: elements/Experimental/NumericFormat.tpl
type: file
unique_id: D7MaXkBV
icon: f:NumberFormat.svg
sourceType: javascript
options:
  - name: content
    display: Content
    type: text
    options: ''
  - name: label
    display: Label
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: formatNumber
    display: Format number
    type: dropdown
    options: 
      return [['none', 'None'],['dotComma', 'Thousand separator "."; Decimal separator ","'],['commaDot', 'Thousand separator ","; Decimal separator "."']]
  - name: decimalScale
    display: Decimal Scale
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { NumericFormat } from 'react-number-format'
{% endset %}
{{ save_delayed('bpr', bpr) }} 
  <NumericFormat 
      value= { {{ element.values.content | raw }}{{ content | raw }} }
      displayType="text"
      {% if element.values.label %}
        label= { {{ element.values.label | raw }} }
      {% endif %}
      {% if element.values.className %}
        className={ {{ element.values.className }} }
      {% endif %}
      {% if element.values.formatNumber == "dotComma" %}
          thousandSeparator="."
          decimalSeparator=","
          {% elseif element.values.formatNumber == "commaDot" %}
            thousandSeparator=","
            decimalSeparator="."
          {% else %}
            decimalSeparator=","
      {% endif %}
      {% if element.values.decimalScale %}
        decimalScale={ {{ element.values.decimalScale }} }
      {% endif %}
  />