/*
path: storeValueRetrieve.tpl
type: file
unique_id: storevalueretrieve
icon: ico-field
helpText: Retrieves a stored value
settings:
  - name: Packages
    value: '"@react-native-async-storage/async-storage": "1.18.2",'
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: valueToVar
    display: Store Directly In Variable (async)
    type: text
  - name: onLoad
    display: Store In State
    type: text
    options: ''
  - name: makeItBoolean
    display: Boolean?
    type: checkbox
    options: ''
  - name: default
    display: Default Value
    type: text
    options: ''
  - name: Parse
    display: Parse as JSON?
    type: checkbox
children: []
*/
{% set bpr %}
import AsyncStorage from '@react-native-async-storage/async-storage'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.valueToVar %}
  const {{ element.values.valueToVar }} ={% if element.values.Parse %}JSON.parse({% endif %}await AsyncStorage.getItem('{{ element.values.variableName }}'){% if element.values.Parse %}){% endif %}
{% else %}
  AsyncStorage.getItem('{{ element.values.variableName }}').then(res => {
    {% if element.values.onLoad %}
      {{ element.values.onLoad }}(
        {% if element.values.makeItBoolean %}Boolean({% endif %}
        {% if element.values.Parse %}JSON.parse({% endif %}res {% if element.values.default %}|| '{{ element.values.default }}'{% endif %}{% if element.values.Parse %}){% endif %}
        {% if element.values.makeItBoolean %}){% endif %}
      )
    {% endif %}
    {{ content|raw }}
  })
{% endif %}