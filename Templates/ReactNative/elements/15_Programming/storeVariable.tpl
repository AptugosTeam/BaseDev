/*
path: storeVariable.tpl
keyPath: elements/Programming/storeVariable.tpl
unique_id: 3a3PEaZR
icon: ico-define-variable
helpText: Persist a value in AsyncStorage under a given key so it can be retrieved later
options:
  - name: variableName
    display: Variable Name
    helpText: Storage key used when saving the value in AsyncStorage
    type: text
    options: ''
  - name: variableValue
    display: Value
    helpText: Expression or literal value that will be stored
    type: text
    options: ''
*/
{% set bpr %}
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr',bpr) }}
AsyncStorage.setItem('{{ element.values.variableName }}', {{ element.values.variableValue}} )
