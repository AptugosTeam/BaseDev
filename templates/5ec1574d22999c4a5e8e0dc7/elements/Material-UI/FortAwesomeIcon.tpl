/*
path: FortAwesomeIcon.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Material-UI/FortAwesomeIcon.tpl
keyPath: elements/Material-UI/FortAwesomeIcon.tpl
type: file
icon: f:MaterialIcon.svg
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
  - name: fontSize
    display: Size (rem, em, px)
    type: text
unique_id: MzMqVMi7
*/
{% set bpr %}
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { useFontAwesomeIconPack } from '@components/IconPicker/useFontAwesomeIconPack'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
useFontAwesomeIconPack()
{% endset %}
{{ save_delayed('ph',ph) }}
<FontAwesomeIcon icon={['fas', {{ element.values.icon|textOrVariableInCode}}]} color="#556ee6" />