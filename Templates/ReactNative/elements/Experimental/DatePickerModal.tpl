/*
path: DatePickerModal.tpl
type: file
unique_id: DPMbOrr4
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: mode
    display: Mode
    type: dropdown
    options: >-
      return [['date','Date'],['time','Time'],['datetime','Date and Time (iOS only)']]
  - name: thedate
    display: Date Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: function
    options: ''
settings:
  - name: Packages
    value: '"@react-native-community/datetimepicker": "8.4.4",'
*/
{% set bpr %}
  import DateTimePicker from '@react-native-community/datetimepicker';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<DateTimePicker
  value={{ element.values.thedate | textOrVariable }}
  mode={{ element.values.mode | textOrVariable }}
  onChange={ {{ element.values.onChange | functionOrCall }} }
/>