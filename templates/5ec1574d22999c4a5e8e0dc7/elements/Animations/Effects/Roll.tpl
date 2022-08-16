/*
path: Roll.tpl
type: file
unique_id: wqyhgf5b
icon: ico-chart-bar
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
import { Roll } from "react-awesome-reveal";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Roll>
  {{ content | raw }}
</Roll>