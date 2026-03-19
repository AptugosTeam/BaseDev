/*
path: MUIDateRangePicker.tpl
type: file
display: DateRangePicker
unique_id: 1Qpv0xp6
icon: ico-uncontrolled-input
sourceType: javascript
order: 1
options:
  - name: value
    display: Value
    type: text
  - name: onChange
    display: On Change (e)
    type: function
  - name: startText
    display: startText
    type: text
  - name: endText
    display: endText
    type: text
  - name: shouldDisableDate
    display: shouldDisableDate
    type: function
  - name: disablePreviousMonths
    display: Disable Previous Months?
    type: checkbox
    options: ''
    settings:
      default: true

settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "5.0.20",'
  - name: Packages
    value: '"@mui/x-date-pickers-pro": "5.0.20",'
  - name: Packages
    value: '"dayjs": "^1.11.10",'
children: []
*/
{% set bpr %}
import { DateRangePicker } from '@mui/x-date-pickers-pro/DateRangePicker'
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider'
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import 'dayjs/locale/es'
import { TextField, Box } from '@mui/material'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<LocalizationProvider
  dateAdapter={AdapterDayjs}
  adapterLocale="en"
  localeText={ { start: {{ element.values.startText | default('from') | textOrVariable }}, end: {{ element.values.endText | default('to') | textOrVariable }} } }  
>
  <DateRangePicker
    value={ {{ element.values.value | default('[null, null]') }} }
    onChange={ {{ element.values.onChange | default('() => {}') | functionOrCall }} }
    {% if element.values.shouldDisableDate %} shouldDisableDate={ {{ element.values.shouldDisableDate | functionOrCall }} }{% endif %}
    {% if element.values.disablePreviousMonths %}disablePast{% endif %}
    renderInput={(startProps, endProps) => (
      <React.Fragment>
        <TextField {...startProps} />
        <Box sx={ { mx: 2 } }> to </Box>
        <TextField {...endProps} />
      </React.Fragment>
    )}
  />
</LocalizationProvider>
