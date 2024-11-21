/*
path: CountUp.tpl
type: file
unique_id: countup666
icon: f:Skeleton.svg
children: []
options:
  - name: start
    display: Start
    type: text
  - name: end
    display: End
    type: text
  - name: duration
    display: Duration
    type: text
  - name: delay
    display: Delay
    type: text
  - name: separator
    display: separator
    type: text
  - name: className
    display: ClassName
    type: styles
settings:
  - name: Packages
    value: '"react-countup": "^6.4.2",'
*/

{% set bpr %}
import CountUp from 'react-countup';
{% endset %}
{{ save_delayed('bpr',bpr) }}

<CountUp
  {% if element.values.start %}
    start={ {{element.values.start}} }
  {% endif %}
  {% if element.values.end %}
    end={ {{element.values.end}} }
  {% endif %}
  {% if element.values.duration %}
    duration={ {{element.values.duration}} }
  {% endif %}
  {% if element.values.delay %}
    delay={ {{element.values.delay}} }
  {% endif %}
  {% if element.values.separator %}
    separator='{{element.values.separator}}'
  {% endif %}
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
/>