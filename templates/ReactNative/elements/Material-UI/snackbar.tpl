/*
path: snackbar.tpl
type: file
unique_id: sU8SWeZz
icon: ico-snackbar
options:
  - name: message
    display: Message
    type: text
    options: ''
  - name: autohide
    display: Auto Hide Duration (ms)
    type: text
    options: ''
  - name: position
    display: Position
    type: dropdown
    options: Top-Left;Top-Center;Top-Right;Bottom-Left;Bottom-Center;Bottom-Right
  - name: varName
    display: Variable Name (snackBarOpen)
    type: text
    settings:
      default: snackBarOpen
      active: true
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: dontCreateVar
    display: Use Existing Variable
    type: checkbox 
    options: ''
    advanced: true
  - name: onClose
    display: On Close (optional)
    type: code
    options: ''
    advanced: true
children: []
*/
{% set bpr %}
import { Snackbar } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if not element.values.dontCreateVar %}
{% set ph %}
const [{{ element.values.varName }}, set{{ element.values.varName }}] = React.useState<any>(false)
{% endset %}
{{ save_delayed('ph', ph ) }}
{% endif %}
{% set splited = element.values.position|split('-') %}
<Snackbar
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.autohide %}duration={ {{ element.values.autohide }} }{% endif %}
  visible={ {{ element.values.varName }} }
  onDismiss={() => { {% if not element.values.dontCreateVar %}set{{ element.values.varName }}(false){% endif %} {% if element.values.onClose %} {{ element.values.onClose }} {% endif %} } }
>
  {% if element.values.message %}{{ element.values.message }}{% endif %}
  {{ content | raw }}
</Snackbar>