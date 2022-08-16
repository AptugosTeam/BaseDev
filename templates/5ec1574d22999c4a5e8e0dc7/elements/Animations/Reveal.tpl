/*
path: Reveal.tpl
type: file
unique_id: 5l45pbjb
icon: ico-field
helpText: Generate HTML pages after build
options:
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
import 'animate.css';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Reveal>
  {{ content | raw }}
</Reveal>