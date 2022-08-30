/*
path: Flash.tpl
completePath: elements\Animations\SpecialsEffects\Flash.tpl
unique_id: qkuEUps3
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/
{% set bpr %}
import Flash from 'react-reveal/Flash';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Flash {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Flash>