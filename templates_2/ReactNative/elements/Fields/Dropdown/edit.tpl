/*
path: edit.tpl
type: file
unique_id: uxhx3Vzb
icon: ico-field
sourceType: javascript
children: []
settings:
  - name: Packages
    value: '"react-native-select-dropdown": "^3.3.3",'
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import SelectDropdown from 'react-native-select-dropdown'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<SelectDropdown
  defaultValue={ {{ tableName }}data.{{ field.column_name | friendly }}}
  data={[{% for item in field.options|split(';') %}'{{ item }}',{% endfor %}]}
  buttonStyle={theme.inputSelector}
  buttonTextStyle={theme.inputSelectorText}
  onSelect={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
/>
