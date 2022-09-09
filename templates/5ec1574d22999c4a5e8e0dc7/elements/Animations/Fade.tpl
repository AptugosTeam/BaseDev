/*
path: Fade.tpl
type: file
unique_id: 5l446pgh
icon: ico-chart-bar
options:
  - name: direction
    display: Direction
    type: dropdown
    options: 
      return [['none', 'None'],['left', 'Left'],['right', 'Right'],['down', 'Down'],['up', 'Up']]
    settings:
      default: none
  - name: delay
    display: Delay
    type: text
    options: ''
  - name: duration
    display: Duration
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
  - name: triggerOnce
    display: Trigger Once
    type: checkbox
    settings:
      default: false
  - name: cascade
    display: Cascade
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: damping
    display: Damping
    type: text
    advanced: true
settings:
  - name: Packages
    value: '"react-awesome-reveal": "^4.0.0",'
  - name: Packages
    value: '"animate.css": "^4.1.1",'
  - name: Packages
    value: '"@emotion/react": "^11.10.4",'
children: []
*/
{% set bpr %}
import Reveal from "react-awesome-reveal";
import { Fade } from "react-awesome-reveal";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Fade   
  {% if element.values.direction != "none" %}
    direction={ "{{ element.values.direction }}" }
  {% endif %}
  delay={ {{element.values.delay|default("0")}} } 
  duration={ {{element.values.duration|default("1000")}} }
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
  {% if element.values.triggerOnce %}
    triggerOnce={true}
  {% endif %}
  {% if element.values.cascade %}
    cascade={true}
  {% endif %}
  damping={ {{element.values.damping|default("0.5")}} }
>
  {{ content | raw }}
</Fade>