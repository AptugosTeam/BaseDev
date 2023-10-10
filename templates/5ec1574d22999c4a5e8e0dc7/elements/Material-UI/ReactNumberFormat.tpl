/*
path: ReactNumberFormat.tpl
completePath: elements/Material-UI/ReactNumberFormat.tpl
type: file
unique_id: reactNum
icon: ico-typography
sourceType: javascript
helpText: Ensures that a user can only enter text that meets specific numeric or string patterns, and formats the input value for display.
options:
  - name: value
    display: Value
    type: text
    options: ''
  - name: prefix
    display: Prefix
    type: text
    options: ''
  - name: customInput
    display: Custom Input
    type: text
    options: ''
  - name: onValueChange
    display: On Value Change
    type: function
    options: ''
  - name: thousandSeparator
    display: Thousand Separator
    type: checkbox
    advanced: false
*/
{% set bpr %}
import { NumericFormat } from "react-number-format";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<NumericFormat
    value={ {{ element.values.value }} }
    {% if element.values.prefix %} prefix="{{element.values.prefix}}" {% endif %}
    {% if element.values.thousandSeparator %}thousandSeparator{% endif %}
    {% if element.values.customInput %} customInput={TextField} {% endif %}
    {% if element.values.onValueChange %}
    onValueChange={ {{ element.values.onValueChange | functionOrCall }} }
    {% endif %}
/>
