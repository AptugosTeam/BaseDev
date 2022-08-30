/*
path: HeadShake.tpl
completePath: elements\Animations\SpecialsEffects\HeadShake.tpl
unique_id: 8U3dLaBP
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import HeadShake from 'react-reveal/HeadShake';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<HeadShake {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</HeadShake>