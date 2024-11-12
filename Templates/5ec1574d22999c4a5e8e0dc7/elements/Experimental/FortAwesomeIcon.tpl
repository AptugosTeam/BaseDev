/*
path: FortAwesomeIcon.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Material-UI/FortAwesomeIcon.tpl
keyPath: elements/Material-UI/FortAwesomeIcon.tpl
type: file
icon: f:../Z-Icons/MaterialIcon.svg
helpText: Shows a fort awesome icon from the list
children: []
options:
  - name: icon
    display: Icon
    type: text
    options: Access
    required: true
  - name: color
    display: Color
    type: dropdown
    options: >-
      return [['primary', 'Primary'],['secondary', 'Secondary'],['error',
      'Error'],['warning', 'Warning'],['info', 'Info'],['success',
      'Success'],['action', 'Action'],['disabled', 'Disabled'],['custom',
      'Custom']]
  - name: custom
    display: Custom Color
    type: text
    settings:
      propertyCondition: color
      condition: custom
      active: true
  - name: className
    display: className
    type: styles
    options: ''
  - name: fontSize
    display: Size (rem, em, px)
    type: text
    options: ''
unique_id: MzMqVMi7
settings:
  - name: Packages
    value: '"@fortawesome/fontawesome-svg-core": "6.3.0","@fortawesome/free-solid-svg-icons": "6.3.0","@fortawesome/react-fontawesome": "0.2.0",'
*/
{% set bpr %}
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { {{ element.values.icon }} } from '@fortawesome/free-solid-svg-icons';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<FontAwesomeIcon 
  icon={ {{ element.values.icon }} }
  color={ 
    {% if element.values.color == 'custom' %}
      {{ element.values.custom|default("#000") }}
    {% else %}
      {{ element.values.color|default("inherit") }}
    {% endif %}
  }
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
  fontSize= '{{ element.values.fontSize|default("1rem") }}'
/>