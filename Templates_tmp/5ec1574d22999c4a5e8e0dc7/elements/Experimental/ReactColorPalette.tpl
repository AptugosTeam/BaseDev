/*
path: ReactColorPalette.tpl
type: file
unique_id: ReactColorPalette
icon: ico-field
sourceType: javascript
options:
  - name: height
    display: Height
    type: text
    options: ''
  - name: hideAlpha
    display: Hide Alpha
    type: checkbox
    options: ''
  - name: color
    display: Current color
    type: text
    options: ''
  - name: varName
    display: Variable Name
    type: text
    options: ''
  - name: onChange
    display: onChange
    type: text
    options: ''
  - name: hideInput
    display: Hide Inputs using array
    type: text
    options: ''
children: []
settings:
  - name: Packages
    value: '"react-color-palette": "^7.2.1",'
*/
{% set bpr %}
import { ColorPicker, useColor } from "react-color-palette"
import "react-color-palette/css"
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
  const [{{element.values.varName | default('color')}}, set{{element.values.varName | default('Color')}}] = useColor('')
{% endset %}
{{ save_delayed('ph', ph) }}
<ColorPicker
{% if element.values.height %}height={ {{ element.values.height}} }{% endif %}
{% if element.values.color %}color={ {{ element.values.color | default('color')}} }{% endif %}
{% if element.values.onChange %}onChange={ {{ element.values.onChange | default('setColor')}} }{% endif %}
{% if element.values.hideInput %}hideInput={ {{ element.values.hideInput }} }{% endif %}
/>