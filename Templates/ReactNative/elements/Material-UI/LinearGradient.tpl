/*
path: LinearGradient.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Material-UI/LinearGradient.tpl
keyPath: elements/Material-UI/LinearGradient.tpl
unique_id: WSocKGyO
options:
  - name: from
    display: From Color
    type: text
  - name: to
    display: To Color
    type: text
  - name: class
    display: ClassName
    type: text
    options: ''
  - name: start
    display: Gradient Start
    type: text
    options: ''
    advanced: true
  - name: end
    display: Gradient End
    type: text
    options: ''
    advanced: true
settings:
  - name: Packages
    value: '"expo-linear-gradient": "~15.0.7",'
*/
{% set bpr %}
import { LinearGradient } from 'expo-linear-gradient';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<LinearGradient
  colors={['{{ element.values.from|default('#000000')}}', '{{ element.values.to|default('#343c46')}}']}
  start={ {{ element.values.start|default('{ x: 0, y: 0 }') }} }
  end={ {{ element.values.end|default('{ x: 1, y: 0 }') }} }
  {% if element.values.class %}style={ {{element.values.class}} }{% endif %}
>
  {{ content | raw }}
</LinearGradient>