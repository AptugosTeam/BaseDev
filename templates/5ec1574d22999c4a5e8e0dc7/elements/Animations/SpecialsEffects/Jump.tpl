/*
path: Jump.tpl
completePath: elements\Animations\SpecialsEffects\Jump.tpl
unique_id: KXoKiA06
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import Jump from "react-reveal/Jump";
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Jump {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Jump>