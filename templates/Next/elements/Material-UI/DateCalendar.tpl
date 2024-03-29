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
settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "latest","dayjs":"1.11.5",'
*/
{% set bpr %}
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { DateCalendar } from '@mui/x-date-pickers/DateCalendar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<LocalizationProvider dateAdapter={AdapterDayjs}>
  <DateCalendar
    {% if element.values.value %}value={{ element.values.value|textOrVariable }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
  />
</LocalizationProvider>