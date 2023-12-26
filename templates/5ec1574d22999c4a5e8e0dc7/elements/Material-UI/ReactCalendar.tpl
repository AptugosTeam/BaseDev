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
  - name: blockDay
    display: blockDay
    type: text
    options: ''
  - name: disableDates
    display: Disable Dates
    type: text
    options: ''
  - name: shouldDisableDate
    display: Should Disable Date?
    type: function
    options: ''
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
  import Badge from '@mui/material/Badge';
  import TextField from '@mui/material/TextField';
  import dayjs from 'dayjs';
  import { DatePicker } from '@mui/x-date-pickers/DatePicker';
  import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
  import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
  import { PickersDay } from '@mui/x-date-pickers/PickersDay';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<LocalizationProvider dateAdapter={AdapterDayjs}>
  <DatePicker
    {% if element.values.class %}
      className={ {{element.values.class|raw}} }
    {% endif %}
    {% if element.values.disableDates %}
      shouldDisableDate={(date: Dayjs) => {
                            let processedDates = {{element.values.disableDates|raw}}.map((theDate) => {
                              theDate.setHours(0)
                              theDate.setMinutes(0)
                              theDate.setSeconds(0)
                              theDate.setMilliseconds(0)
                              return theDate.getTime()
                            })
                            return processedDates.includes(new Date(date).getTime()) || arrr.includes(new Date(date).getDay())
                        }}
    {% endif %}
    {% if element.values.shouldDisableDate %}
    shouldDisableDate={
      {{element.values.shouldDisableDate}}
    }
    {% endif %}
    label={"Selecciona una fecha"}
    disablePast={true}
    disableHighlightToday={true}
    maxDate={new Date(new Date().getFullYear(), new Date().getMonth() + 2, 0)}
    value={DateValue}
    inputFormat="DD/MM/YYYY"
    {% if element.values.onChange %}
    onChange={(newValue) => {
      {{element.values.onChange}}
    }}
    {% endif %}
    renderInput={(params) => <TextField {...params} />}
    renderDay={(day, _value, DayComponentProps) => {
    const isSelected =
      !DayComponentProps.outsideCurrentMonth &&
      highlightedDays.indexOf(day.date()) > 0;
    return (
        <Badge
        key={day.toString()}
        overlap="circular"
        badgeContent={isSelected ? '❌' : undefined}
        >
          <PickersDay {...DayComponentProps} />
        </Badge>
      );
    }}
  />
</LocalizationProvider>  