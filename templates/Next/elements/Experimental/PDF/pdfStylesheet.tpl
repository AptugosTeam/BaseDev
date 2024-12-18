/*
path: pdfStylesheet.tpl
completePath: elements/Experimental/PDF/pdfStylesheet.tpl
type: file
unique_id: yGt17Xuq
icon: f:pdfStylesheet.svg
sourceType: javascript
options:
  - name: variableName
    display: Stylesheet Variable Name
    type: text
  - name: styles
    display: Styles
    type: text
*/
{% set bpr %}
  import { StyleSheet } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
  {% if element.values.variableName and element.values.styles %}
    const {{ element.values.variableName }} = StyleSheet.create({{ element.values.styles | raw }})
  {% endif %}
{% endset %}
{{ save_delayed('ph', ph) }}