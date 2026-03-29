/*
path: useReduxSelector.tpl
display: Use Redux Selector
keyPath: elements/Programming/Redux/useReduxSelector.tpl
type: file
unique_id: useReduxSelectorTplA1v9
icon: ico-load-redux
sourceType: javascript
helpText: Reads a custom Redux slice from the frontend store and stores it in a local variable
options:
  - name: storeKey
    display: Store Key
    type: text
    options: ''
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: propertyPath
    display: Property Path
    type: text
    options: ''
  - name: selectorCode
    display: Custom Selector Code
    type: code
    options: ''
    advanced: true
children: []
*/
{% set variableName = element.values.variableName %}
{% set storeKey = element.values.storeKey %}
{% set propertyPath = element.values.propertyPath %}

{% set bpr %}
import { useSelector } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { RootState } from '@store/store'
{% endset %}
{{ save_delayed('bpr', bpr ) }}

{% if element.values.selectorCode %}
const {{ variableName }} = useSelector((state: RootState) => {{ element.values.selectorCode | raw }})
{% else %}
const {{ variableName }} = useSelector((state: RootState) => state.{{ storeKey }}{% if propertyPath %}.{{ propertyPath }}{% endif %})
{% endif %}
