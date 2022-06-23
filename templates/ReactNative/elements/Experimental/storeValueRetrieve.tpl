/*
path: storeValueRetrieve.tpl
type: file
unique_id: storevalueretrieve
icon: ico-field
helpText: Retrieves a stored value
settings:
  - name: Packages
    value: '"@react-native-async-storage/async-storage": "^1.17.6",'
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: onLoad
    display: Store In Variable
    type: text
    options: ''
children: []
*/
{% set bpr %}
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr',bpr) }}
let {{ element.values.onLoad }}
AsyncStorage.getItem('{{ element.values.variableName }}').then(res => { {{ element.values.onLoad }} = res })