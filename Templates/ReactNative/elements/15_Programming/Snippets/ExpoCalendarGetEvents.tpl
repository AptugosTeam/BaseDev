/*
path: ExpoCalendarGetEvents.tpl
keyPath: elements/15_Programming/Snippets/ExpoCalendarGetEvents.tpl
unique_id: tTecgeRth
options:
  - name: fromDate
    display: From Date
    type: text
    options: ''
  - name: toDate
    display: To Date
    type: text
    options: ''
*/
{% set bpr %}
import * as Calendar from 'expo-calendar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
Calendar.getCalendarsAsync(Calendar.EntityTypes.EVENT).then(calendars => {
  return Calendar.getEventsAsync( calendars.map(c => c.id), {{ element.values.fromDate | textOrVariableInCode }}, {{ element.values.toDate | textOrVariableInCode }}).then(events => {
    {{ content | raw }}
  })
})