/*
path: Fade.tpl
type: file
unique_id: 5l446pgh
icon: ico-chart-bar
helpText: Generate HTML pages after build
options:
  - name: direction
    display: direction
    type: dropdown
    options: down;up;left;right
settings:
  - name: Packages
    value: '"react-awesome-reveal": "^4.0.0",'
  - name: Packages
    value: '"animate.css": "^4.1.1",'
  - name: npmScripts
    value: '"postbuild": "react-awesome-reveal",'
  - name: npmScripts
    value: '"postbuild": "animate.css",'
children: []
*/
{% set bpr %}
import Reveal from "react-awesome-reveal";
import { Fade } from "react-awesome-reveal";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Fade direction="{{ element.values.direction }}">
  {{ content | raw }}
</Fade>