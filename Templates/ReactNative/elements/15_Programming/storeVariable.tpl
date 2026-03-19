/*
path: storeVariable.tpl
keyPath: elements/Programming/storeVariable.tpl
unique_id: 3a3PEaZR
icon: ico-define-variable
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
*/
{% set bpr %}
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr',bpr) }}
AsyncStorage.setItem('{{ element.values.variableName }}', {{ element.values.variableValue}} )