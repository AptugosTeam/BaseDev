/*
path: Flip.tpl
completePath: elements/Animations/Flip.tpl
type: file
unique_id: jkis1f5b
icon: f:Flip.svg
options:
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
import { Flip } from "react-awesome-reveal";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Flip 
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
</Flip>