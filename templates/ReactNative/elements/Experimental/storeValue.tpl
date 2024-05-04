/*
path: storeValue.tpl
type: file
unique_id: storevalue
icon: ico-field
helpText: Store a value
settings:
  - name: Packages
    value: '"@react-native-async-storage/async-storage": "1.18.2",'
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: variableValue
    display: Value
    type: text
    options: ''
  - name: await
    display: Await?
    type: checkbox
    options: ''
    settings:
      value: 'false'
children: []
*/
{% set bpr %}
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.await %}await{% endif %} AsyncStorage.setItem('{{ element.values.variableName }}', {{ element.values.variableValue }})
