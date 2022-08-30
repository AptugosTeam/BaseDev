/*
path: Zoom.tpl
type: file
unique_id: 5l4jkslb
icon: ico-chart-bar
helpText: Generate HTML pages after build
options:
  - name: direction
    display: direction
    type: dropdown
    options: Left;Right;Top;Bottom
  - name: delay
    display: Delay
    type: dropdown
    options: 1000;2000;3000;4000;5000
  - name: duration
    display: Duration
    type: dropdown
    options: 1000;2000;3000;4000;5000
settings:
  - name: Packages
    value: '"react-awesome-reveal": "^4.0.0",'
  - name: Packages
    value: '"animate.css": "^4.1.1",'
children: []
*/
{% set bpr %}
import Reveal from "react-awesome-reveal";
import { Zoom } from "react-awesome-reveal";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Zoom {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Zoom>