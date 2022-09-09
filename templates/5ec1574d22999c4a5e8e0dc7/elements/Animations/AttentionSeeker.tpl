/*
path: AttentionSeeker.tpl
type: file
unique_id: 5l43321b
icon: ico-chart-bar
options:
  - name: delay
    display: Delay
    type: text
    options: ''
  - name: duration
    display: Duration
    type: text
    options: ''
  - name: effect
    display: Effect
    type: dropdown
    options: 
      return [['flash', 'Flash'],['headShake', 'HeadShake'],['heartBeat', 'HeartBeat'],['jello', 'Jello'],['pulse', 'Pulse'],['rubberBand', 'RubberBand'],['shakeX', 'ShakeX'],['shakeY', 'ShakeY'],['swing', 'Swing'],['tada', 'Tada'],['wobble', 'Wobble']]
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
import { AttentionSeeker } from "react-awesome-reveal";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<AttentionSeeker 
  effect={ "{{ element.values.effect|default(bounce) }}" }
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
</AttentionSeeker>