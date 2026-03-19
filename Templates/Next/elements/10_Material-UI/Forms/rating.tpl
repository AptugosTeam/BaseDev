/*
path: rating.tpl
completePath: elements/Material-UI/Forms/rating.tpl
type: file
unique_id: Wrw98VXK
icon: f:rating.svg
children: []
options:
  - name: max
    display: Max Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: name
    display: Field Name
    type: text
    options: ''
  - name: icon
    display: Icon
    type: dropdown
    options: >-
      return [['Star', 'Star'],['Favorite', 'Favorite']]
    settings:
      default: Star
  - name: fontSize
    display: Icon size
    type: text
  - name: fontUnit
    display: Size unit
    type: dropdown
    options: >-
      return [['px', 'Px'], ['em', 'Em'], ['rem', 'Rem']]
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: value
    display: Value
    type: text
    options: ''
    advanced: true
  - name: precision
    display: Increment Value
    type: dropdown
    advanced: true
    options: 
      return [['1', '1'],['0.5', '0.5'],['0.25', '0.25'],['0.1', '0.1'],['0.05', '0.05'],['0.01', '0.01']]
    settings:
      default: 1
  - name: onHover
    display: On Hover
    type: function
    options: ''
    advanced: true
  - name: classname
    display: ClassName
    type: styles
    options: ''
    advanced: true
  - name: readOnly
    display: Read Only
    type: checkbox
    options: ''
    settings:
      default: false
    advanced: true
*/
{% set bpr %}
import Rating from '@mui/material/Rating'
import {{element.values.icon}}Icon from '@mui/icons-material/{{element.values.icon}}'
import {{element.values.icon}}Border from '@mui/icons-material/{{element.values.icon}}Border'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Rating
  {% if element.values.value %}
    value={ {{ element.values.value }} } 
  {% endif %}
  {% if element.values.max %}
    max={ {{ element.values.max }} }
  {% endif %}
  {% if element.values.onChange %}
    onChange={ {{ element.values.onChange }} }
  {% endif %}
  {% if element.values.icon %}
      icon={ <{{element.values.icon}}Icon fontSize= 'inherit'/> }
      emptyIcon={ <{{element.values.icon}}Border fontSize= 'inherit'/> }
  {% endif %}
  {% if element.values.fontSize %}
    sx={ { fontSize: "{{ element.values.fontSize }}{{ element.values.fontUnit|default('px') }}", } }
  {% endif %}
  {% if element.values.precision != '1' %}
    precision={ {{ element.values.precision|default('1') }} }
  {% endif %}
  {% if element.values.name %}
    name={{ element.values.name | textOrVariable }}
  {% endif %}
  {% if element.values.readOnly %}
    readOnly={true}
  {% endif %}
  {% if element.values.onHover %}
    onChangeActive={ {{ element.values.onHover }} }
  {% endif %}
  {% if element.values.classname %}
    className={ {{ element.values.classname | raw }} }
  {% endif %}
/>