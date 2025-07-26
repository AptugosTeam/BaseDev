/*
path: DateTimePicker.tpl
type: file
unique_id: DateTimePicker
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: mode
    display: Mode
    type: dropdown
    options: >-
      return [['date', 'Date'],['time', 'Time'],['datetime', 'Date Time (iOS)'],['countdown', 'Countdown (iOS)']]
  - name: value
    display: Value
    type: text
    options: ''
  - name: display
    display: Display
    type: dropdown
    options: >-
      return [['default', 'Default'],['spinner', 'Spinner'],['calendar', 'Calendar (date mode)'],['clock', 'Clock (time mode)'],['compact', 'Compact (iOS)'], ['inline', 'Inline (iOS)']]
  - name: onChange
    display: On Change
    type: code
    options: ''
  - name: maximumDate
    display: Maximun Date
    type: text
    options: ''
settings:
  - name: Packages
    value: '"@react-native-community/datetimepicker": "8.4.2",'
*/
{% set bpr %}
import DateTimePicker from '@react-native-community/datetimepicker'
{% endset %}
{{ save_delayed('bpr', bpr) }}
  <DateTimePicker
    value={{ element.values.value }}
    mode='{{ element.values.mode }}'
    display='{{ element.values.display }}'
    onChange={(event, selectedDate) => {
    {{ element.values.onChange | raw }}
    }}
    maximumDate={ {{element.values.maximumDate}} }
  />