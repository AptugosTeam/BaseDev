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
children: []
settings:
  - name: Packages
    value: '"@mui/x-date-pickers": "^5.0.8",'
*/
{% set bpr %}
  import Badge from '@mui/material/Badge';
  import TextField from '@mui/material/TextField';
  import { DatePicker } from '@mui/x-date-pickers/DatePicker';
  import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
  import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
  import { PickersDay } from '@mui/x-date-pickers/PickersDay';
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
   const isWeekend = (date) => {
    const day = date.date()
    return day === 6 //{{element.values.blockDay}}
  };
{% endset %}
{{ save_delayed('ph',ph) }}
<LocalizationProvider dateAdapter={AdapterDayjs}>
  <DatePicker
    {% if element.values.class %}
      className={ {{element.values.class|raw}} }
    {% endif %}
    shouldDisableDate={isWeekend}
    label="Date"
    value={DateValue}
    onChange={(newValue) => {
      setDateValue(newValue)
    }}
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