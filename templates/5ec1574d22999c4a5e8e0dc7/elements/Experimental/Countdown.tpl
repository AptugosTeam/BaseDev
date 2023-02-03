/*
path: Countdown.tpl
completePath: elements/Experimental/Countdown.tpl
type: file
unique_id: pLo48nql
icon: ico-field
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: year
    display: Year
    type: text
    settings:
      default: '2023'
    required: true
  - name: month
    display: Month
    type: dropdown
    options:
      return [['Jan', 'January'],['Feb', 'February'], ['Mar', 'March'], ['Apr', 'April'], ['May', 'May'], ['Jun', 'June'], ['Jul', 'July'], ['Aug', 'August'], ['Sep', 'September'], ['Oct', 'October'], ['Nov', 'November'], ['Dec', 'December']]
    settings:
      default: 'Jan'
    required: true
  - name: days
    display: Days
    type: dropdown
    options: 01;02;03;04;05;06;07;08;09;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31
    settings:
      default: '01'
    required: true
  - name: time
    display: Time
    type: text
    settings:
      default: '00:00:00'
    required: true
  - name: afterCountdown
    display: Text to display after countdown ends
    type: text
settings:
  - name: Packages
    value: '"react-countdown": "^2.3.5",'
children: []
*/

{% set bpr %}
  import Countdown, { zeroPad } from 'react-countdown';
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}


const Timer = ({ days, hours, minutes, seconds }) => {
  return (
    <div 
    {% if element.values.className %}
      className={ {{ element.values.className }} }
    {% endif %} 
    >
      <div>
        <p>{zeroPad(days)}</p>
        <p>días</p>
      </div>
      <div>
        <p>{zeroPad(hours)}</p>
        <p>horas</p>
      </div>
      <div>
        <p>{zeroPad(minutes)}</p>
        <p>minutos</p>
      </div>
      <div>
        <p>{zeroPad(seconds)}</p>
        <p>segundos</p>
      </div>
    </div>
  )
}
{% endset %}
{{ save_delayed('ph',ph) }}

<Countdown
  date={'{{ element.values.month|default("Jan") }} {{ element.values.days }}, {{ element.values.year|default("2023") }} {{ element.values.time|default("00:00:00") }}'}
  renderer={(props) => {
    {% if element.values.afterCountdown %}
      if(props.completed){
        return (<h3> {{ element.values.afterCountdown }} </h3>)
      } else {
          return (
            <Timer
              days={props.days}
              hours={props.hours}
              minutes={props.minutes}
              seconds={props.seconds}
            />
          )}
    {% else %}
      return (
        <Timer
          days={props.days}
          hours={props.hours}
          minutes={props.minutes}
          seconds={props.seconds} 
        /> )
    {% endif %}
  }} 
/>

