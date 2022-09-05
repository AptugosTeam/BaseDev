/*
path: Rotate.tpl
type: file
unique_id: ahjl1f5b
icon: ico-chart-bar
helpText: Generate HTML pages after build
options:
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
  - name: Packages
    value: '"@emotion/react": "^11.10.4",'
children: []
*/
{% set bpr %}
import Reveal from "react-awesome-reveal";
import { Rotate } from "react-awesome-reveal";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Rotate {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Rotate>