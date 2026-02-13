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
children: []
*/
{% set bpr %}
import Snackbar from '@mui/material/Snackbar'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const [{{ element.values.varName }}, set{{ element.values.varName }}] = React.useState(false)
{% endset %}
{{ save_delayed('ph', ph ) }}
{% set splited = element.values.position|split('-') %}
<Snackbar
  open={ {{ element.values.varName }} }
  {% if element.values.message %}message={{ element.values.message | textOrVariable }}{% endif %}
  {% if element.values.autohide %}autoHideDuration={ {{ element.values.autohide }} }{% endif %}
  onClose={() => { set{{ element.values.varName }}(false) } }
  anchorOrigin={ { vertical: '{{splited[0]|lower}}', horizontal: '{{splited[1]|lower}}' } }
>{{ content | raw }}</Snackbar>