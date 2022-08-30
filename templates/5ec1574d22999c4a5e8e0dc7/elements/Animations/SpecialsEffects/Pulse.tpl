/*
path: Pulse.tpl
completePath: elements\Animations\SpecialsEffects\Pulse.tpl
unique_id: 78p8tOkK
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import Pulse from 'react-reveal/Pulse';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Pulse {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Pulse>