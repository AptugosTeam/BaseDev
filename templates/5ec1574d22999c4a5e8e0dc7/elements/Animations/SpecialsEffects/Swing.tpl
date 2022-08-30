/*
path: Swing.tpl
completePath: elements\Animations\SpecialsEffects\Swing.tpl
unique_id: HyGXf6bz
settings:
  - name: Packages
    value: '"react-reveal": "^1.2.2",'
  - name: npmScripts
    value: '"postbuild": "react-reveal",'
*/

{% set bpr %}
import Swing from 'react-reveal/Swing';
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Swing {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif%} {% if element.values.delay %}delay={ {{element.values.delay|default('4000')}} } {% endif %} {% if element.values.duration %}duration={ {{element.values.duration|default('3000')}} }{% endif %}>
  {{ content | raw }}
</Swing>