/*
path: ExpoCalendar.tpl
keyPath: elements/15_Programming/Snippets/ExpoCalendar.tpl
unique_id: tTcececRth
options:
  - name: permissionText
    display: Reason Text
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-calendar": "~15.0.7",'
*/
{% set AppJsonPlugins %}
[
  "expo-calendar",
  {
    "calendarPermission": "{{ element.values.permissionText|default("The app needs to access your calendar.")}}"
  }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% set bpr %}
import * as Calendar from 'expo-calendar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
const { status } = await Calendar.requestCalendarPermissionsAsync()
if (status === 'granted') {
  {{ content | raw }}
}
