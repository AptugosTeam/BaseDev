/*
path: InfiniteLooper.tpl
completePath: elements/Experimental/InfiniteLooper.tpl
type: file
unique_id: oINfMXpk
icon: ico-carousel
sourceType: javascript
options:
  - name: speed
    display: Speed
    type: text
    settings:
      default: '1'
  - name: direction
    display: Direction
    type: dropdown
    options: 
      return [['right', 'Right'], ['left', 'Left']]
    settings:
      default: 'left'
  - name: finalGap
    display: Final Gap
    type: text
    settings:
      default: '1'
children: []
*/

{% set bpr %}
import InfiniteLooper from '@components/InfiniteLooper/InfiniteLooper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<InfiniteLooper
  {% if element.values.speed %}
    speed={{ element.values.speed|default("1") | textOrVariable }}
  {% endif %}
  {% if element.values.direction %}
    direction='{{ element.values.direction|default("left") }}'
  {% endif %}
    finalGap={{ element.values.finalGap|default("1") | textOrVariable }}
>   
  {{ content | raw }}
</InfiniteLooper>