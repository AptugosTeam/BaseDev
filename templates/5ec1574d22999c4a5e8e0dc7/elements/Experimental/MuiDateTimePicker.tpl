/*
path: MuiDateTimePicker.tpl
type: file
unique_id: dateTime
icon: f:ReactCarousel.svg
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: label
    display: label
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: disableTimePicker
    display: Disable Time Picker
    type: checkbox
    settings:
      default: false 
  - name: onChange
    display: On Change
    type: function
    options: ''
children: []
settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "^5.0.8",'
  - name: Packages
    value: '"dayjs": "^1.11.7",'
*/
{% set bpr %}
  import TextField from '@mui/material/TextField';
  import dayjs from 'dayjs';
  import { DateTimePicker } from '@mui/x-date-pickers/DateTimePicker';
  import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
  import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<LocalizationProvider dateAdapter={AdapterDayjs}>
  <DateTimePicker
    renderInput={(params) => <TextField {...params} />}
    {% if element.values.class %}
      className={ {{element.values.class|raw}} }
    {% endif %}
    {% if element.values.label %}
        label={{ element.values.label | textOrVariable }}
    {% endif %}
    {% if element.values.value %}
        value={{ element.values.value }}
    {% endif %}
    {% if element.values.disableTimePicker %}
        inputFormat="DD/MM/YYYY" 
        views={['year', 'month', 'day']}
    {% endif %}
    {% if element.values.disableTimePicker == false %}
        inputFormat="DD/MM/YYYY HH:mm" 
    {% endif %}
    {% if element.values.onChange %}
        onChange={ {{ element.values.onChange | functionOrCall }} }
    {% endif %}
  />
</LocalizationProvider>  