/*
path: Tada.tpl
completePath: elements\Animations\SpecialsEffects\Tada.tpl
unique_id: V7uaT5lg
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import Tada from 'react-reveal/Tada';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Tada {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Tada>