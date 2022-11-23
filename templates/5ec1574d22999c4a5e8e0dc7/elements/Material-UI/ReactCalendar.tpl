/*
path: ReactCalendar.tpl
type: file
unique_id: iJY57xUt
icon: f:ReactCarousel.svg
sourceType: javascript
options:
  - name: ClassName
    display: ClassName
    type: styles
    options: ''
  - name: onChange
    display: On Change
    type: code
    advanced: true
    options: ''
children: []
settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "^5.0.8",'
*/

{% set bpr %}
  import TextField from '@mui/material/TextField';
  import { DatePicker } from '@mui/x-date-pickers/DatePicker';
  import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
  import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
{% endset %}

{{ save_delayed('bpr', bpr) }}
<LocalizationProvider dateAdapter={AdapterDayjs}>
  <DatePicker
    label="Date"
    value={value}
    onChange={(newValue) => {
    setValue(newValue);
    }}
    renderInput={(params) => <TextField {...params} />}
  />
</LocalizationProvider>   