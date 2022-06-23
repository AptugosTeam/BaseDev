/*
path: storeValue.tpl
type: file
unique_id: storevalue
icon: ico-field
helpText: Store a value
settings:
  - name: Packages
    value: '"@react-native-async-storage/async-storage": "^1.17.6",'
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
children: []
*/
{% set bpr %}
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr',bpr) }}
AsyncStorage.setItem('{{ element.values.variableName }}', {{ element.values.variableValue }})
