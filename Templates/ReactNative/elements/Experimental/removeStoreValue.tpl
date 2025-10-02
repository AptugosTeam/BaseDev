/*
path: removeStoreValue.tpl
type: file
unique_id: removeStoreValue
icon: ico-field
helpText: Remove a stored value from AsyncStorage
settings:
  - name: Packages
    value: '"@react-native-async-storage/async-storage": "^2.2.0",'
options:
  - name: remove
    display: Select a option to remove
    type: dropdown
    options: return [['key','Use a key'], ['all','Clear all data']]
  - name: keyToUse
    display: key to remove
    type: text
    options: ''
    settings:
      condition: key
      propertyCondition: remove
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

{% if element.values.remove == 'key' %}
    {% if element.values.await %}await{% endif %} AsyncStorage.removeItem('{{ element.values.keyToUse }}')
{% elseif element.values.remove == 'all' %}
    {% if element.values.await %}await{% endif %} AsyncStorage.clear()
{% endif %}