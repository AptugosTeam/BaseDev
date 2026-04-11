/*
path: DateCalendar.tpl
keyPath: elements/Material-UI/DateCalendar.tpl
unique_id: pVBua0RM
deprecated: true
options:
  - name: value
    display: Value
    type: text
  - name: defaultValue
    display: Default Value
    type: text
  - name: onChange
    display: On Change
    type: text
  - name: minDate
    display: Min Date
    type: text
  - name: maxDate
    display: Max Date
    type: text
  - name: disablePast
    display: Disable Past
    type: boolean
  - name: disableFuture
    display: Disable Future
    type: boolean
  - name: views
    display: Views
    type: text
    helpText: Example ['year','month','day']
  - name: className
    display: className
    type: styles
settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "^8.0.0","dayjs":"^1.11.13",'
*/
{% set bpr %}
import dayjs from 'dayjs'
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { DateCalendar } from '@mui/x-date-pickers/DateCalendar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<LocalizationProvider dateAdapter={AdapterDayjs}>
  <DateCalendar
    {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
    {% if element.values.value %}value={typeof {{ element.values.value|textOrVariableInCode }} === 'string' ? dayjs({{ element.values.value|textOrVariableInCode }}) : {{ element.values.value|textOrVariableInCode }}}{% endif %}
    {% if element.values.defaultValue %}defaultValue={typeof {{ element.values.defaultValue|textOrVariableInCode }} === 'string' ? dayjs({{ element.values.defaultValue|textOrVariableInCode }}) : {{ element.values.defaultValue|textOrVariableInCode }}}{% endif %}
    {% if element.values.minDate %}minDate={typeof {{ element.values.minDate|textOrVariableInCode }} === 'string' ? dayjs({{ element.values.minDate|textOrVariableInCode }}) : {{ element.values.minDate|textOrVariableInCode }}}{% endif %}
    {% if element.values.maxDate %}maxDate={typeof {{ element.values.maxDate|textOrVariableInCode }} === 'string' ? dayjs({{ element.values.maxDate|textOrVariableInCode }}) : {{ element.values.maxDate|textOrVariableInCode }}}{% endif %}
    {% if element.values.disablePast %}disablePast{% endif %}
    {% if element.values.disableFuture %}disableFuture{% endif %}
    {% if element.values.views %}views={ {{ element.values.views|textOrVariable }} }{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
  />
</LocalizationProvider>