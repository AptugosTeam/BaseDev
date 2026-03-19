/*
path: edit.tpl
type: file
unique_id: pcy5ZgWy
icon: ico-field
sourceType: javascript
children: []
settings:
  - name: Packages
    value: '"@react-native-community/datetimepicker": "3.5.2",'
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import DateTimePicker from '@react-native-community/datetimepicker'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<DateTimePicker
  display='calendar'
  mode={'date'}
  testID="{{ element.values.unique_id }}"            
  value={ {{ tableName }}data.{{ field.column_name | friendly }} || new Date() }
  onChange={(e,selectedDate) => { handle{{ tableName }}Change('{{ field.column_name | friendly }}')(selectedDate) }}
/>