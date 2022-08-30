/*
path: Wobble.tpl
completePath: elements\Animations\SpecialsEffects\Wobble.tpl
unique_id: 5nNrXrgf
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import Wobble from 'react-reveal/Wobble';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Wobble {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Wobble>