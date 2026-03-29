/*
path: dispatchReduxAction.tpl
display: Dispatch Redux Action
keyPath: elements/Programming/Redux/dispatchReduxAction.tpl
type: file
unique_id: dispatchReduxActionTplB7w2
icon: ico-save-to-redux
sourceType: javascript
helpText: Imports a custom Redux action and dispatches it from the frontend
options:
  - name: sliceFileName
    display: Slice File Name
    type: text
    options: ''
  - name: actionName
    display: Action Name
    type: text
    options: ''
  - name: payload
    display: Payload
    type: code
    options: ''
  - name: awaitDispatch
    display: Await Dispatch?
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: variableStore
    display: Store Result In Variable?
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
  - name: variableStoreType
    display: Variable Type
    type: dropdown
    options: const;let;existing let
    advanced: true
    settings:
      propertyCondition: variableStore
      condition: true
  - name: variableStoreName
    display: Variable Name
    type: text
    options: ''
    advanced: true
    settings:
      propertyCondition: variableStore
      condition: true
children: []
*/
{% set sliceFileName = element.values.sliceFileName | default('customSlice') %}
{% set actionName = element.values.actionName | default('setData') %}
{% set variableStoreName = element.values.variableStoreName | default('dispatchResult') %}
{% set variableStoreType = element.values.variableStoreType | default('const') %}
{% set payload %}
{% if element.values.payload %}
{{ element.values.payload | raw }}
{% endif %}
{% endset %}

{% set bpr %}
import { {{ actionName }} } from '@store/slices/{{ sliceFileName }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { useAppDispatch } from '@store/store'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const dispatch = useAppDispatch()
{% endset %}
{{ save_delayed('ph', ph ) }}

{% if element.values.variableStore %}
  {% if variableStoreType == 'existing let' %}
{{ variableStoreName }} = {% if element.values.awaitDispatch %}await {% endif %}dispatch({{ actionName }}({% if element.values.payload %}{{ payload | trim }}{% endif %}))
  {% else %}
{{ variableStoreType }} {{ variableStoreName }} = {% if element.values.awaitDispatch %}await {% endif %}dispatch({{ actionName }}({% if element.values.payload %}{{ payload | trim }}{% endif %}))
  {% endif %}
{% else %}
{% if element.values.awaitDispatch %}await {% endif %}dispatch({{ actionName }}({% if element.values.payload %}{{ payload | trim }}{% endif %}))
{% endif %}
