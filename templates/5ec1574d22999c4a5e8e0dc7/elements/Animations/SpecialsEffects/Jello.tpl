/*
path: Jello.tpl
completePath: elements\Animations\SpecialsEffects\Jello.tpl
unique_id: rVmARwJb
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import Jello from "react-reveal/Jello";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Jello {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Jello>