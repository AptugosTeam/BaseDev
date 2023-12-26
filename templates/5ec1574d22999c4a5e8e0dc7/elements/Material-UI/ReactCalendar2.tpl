/*
path: ReactCalendar2.tpl
type: file
unique_id: iJY57xUt2
icon: f:ReactCarousel.svg
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: view
    display: View
    type: dropdown
    options: month;year;decade;century
  - name: value
    display: Value
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: tileClassname
    display: Tile Classname
    type: text
    options: ""
  - name: disabledDays
    display: Disabled Days
    type: text
    options: ''
children: []
settings:
  - name: Packages
    value: '"react-calendar": "^4.1.0",'
*/
{% set bpr %}
  import Calendar from 'react-calendar';
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
  
{% endset %}
{{ save_delayed('ph',ph) }}
<Calendar
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
  {% if element.values.view %}view='{{ element.values.view }}'{% endif %}
  {% if element.values.value %}value={ {{element.values.value}} }{% endif %}
  {% if element.values.onChange %}onChange={(e) => {{element.values.onChange}} }{% endif %}
  {% if element.values.disabledDays %}tileDisabled={ ({date, view}) => (
    (view === "month") &&
     {{element.values.disabledDays}}.some(disabledDate =>
      date.getFullYear() === disabledDate.getFullYear() &&
      date.getMonth() === disabledDate.getMonth() &&
      date.getDate() === disabledDate.getDate()
    )
  ) }{% endif %}
  {% if element.values.tileClassname %}
    tileClassName={({date,view}) => {
    {{ element.values.tileClassname }}
    }}
  {% endif %}
/>