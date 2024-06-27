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
    type: text
settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "latest",'
  - name: Packages
    value: '"@mui/x-date-pickers-pro": "latest",'
  - name: Packages
    value: '"dayjs": "^1.11.10",'
children: []
*/
{% set bpr %}
import { DateRangePicker } from '@mui/x-date-pickers-pro/DateRangePicker';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import 'dayjs/locale/es';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<LocalizationProvider dateAdapter={AdapterDayjs} adapterLocale="es">
      <DateRangePicker
        localeText={{ start: {{ element.values.startText | textOrVariable }}, end: {{ element.values.endText | textOrVariable }} }}        
        value={ {{ element.values.value | textOrVariable }} }
        {% if element.values.onChange %}
            onChange={ {{ element.values.onChange | functionOrCall }} }
        {% endif %}
        shouldDisableDate={ {{ element.values.shouldDisableDate | raw }} }
        renderInput={(startProps, endProps) => (
          <>
            <TextField {...startProps} />
            <TextField {...endProps} />
          </>
        )}
      />
    </LocalizationProvider>
