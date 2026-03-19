/*
path: Blur.tpl
keyPath: elements/Material-UI/Blur.tpl
unique_id: WcccKGyO
options:
  - name: intensity
    display: Intensity
    type: text
  - name: class
    display: ClassName
    type: text
    options: ''
  - name: tint
    display: Tint
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-blur": "~15.0.7",'
*/
{% set bpr %}
import { BlurView } from "expo-blur"
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<BlurView
  intensity={ {{ element.values.intensity | default(90) }}}
  {% if element.values.class %}style={ {{element.values.class}} }{% endif %}
  tint="{{ element.values.tint | default('light') }}"
>
  {{ content | raw }}
</BlurView>