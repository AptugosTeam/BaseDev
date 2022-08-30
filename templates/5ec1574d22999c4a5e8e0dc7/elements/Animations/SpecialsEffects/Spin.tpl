/*
path: Spin.tpl
completePath: elements\Animations\SpecialsEffects\Spin.tpl
unique_id: P9AEgU1A
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import Spin from 'react-reveal/Spin';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Spin {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Spin>