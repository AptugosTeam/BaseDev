/*
path: DateCalendar.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Material-UI/DateCalendar.tpl
keyPath: elements/Material-UI/DateCalendar.tpl
unique_id: pVBua0RM
options:
  - name: value
    display: Value
    type: text
  - name: onChange
    display: On Change
    type: text
  - name: onMonthChange
    display: On Change Month
    type: function
    options: ''
  - name: iconDays
    display: Icon for Days
    type: text
  - name: selectDays
    display: Select Days
    type: text
settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "6.20.2","dayjs":"1.11.5",'
*/
{% set bpr %}
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { DateCalendar } from '@mui/x-date-pickers/DateCalendar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const [{{ element.values.selectDays }}, set{{ element.values.selectDays }}] = React.useState([])
{% endset %}
{{ save_delayed('ph', ph ) }}
<LocalizationProvider dateAdapter={AdapterDayjs}>
  <DateCalendar
    {% if element.values.value %}value={{ element.values.value|textOrVariable }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
    {% if element.values.onMonthChange %}onMonthChange={ {{ element.values.onMonthChange | functionOrCall }} }{% endif %}
    {% if element.values.iconDays %}slots={ { day: {{ element.values.iconDays }} } }{% endif %}
    {% if element.values.selectDays %}slotProps={ { day: { {{ element.values.selectDays }} } as any } }{% endif %}
  />
</LocalizationProvider>