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
      return [['reverse', 'Right'], ['normal', 'Left']]
    settings:
      default: 'normal'
children: []
*/

{% set bpr %}
import InfiniteLooper from '@components/InfiniteLooper/InfiniteLooper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<InfiniteLooper
  {% if element.values.speed %}
    speed='{{ element.values.speed|default("1") }}'
  {% endif %}
  {% if element.values.direction %}
    direction='{{ element.values.direction|default("normal") }}'
  {% endif %}
>   
  {{ content | raw }}
</InfiniteLooper>