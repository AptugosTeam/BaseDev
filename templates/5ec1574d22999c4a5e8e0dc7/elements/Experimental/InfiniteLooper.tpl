/*
path: InfiniteLooper.tpl
type: file
unique_id: oINfMXpk
icon: ico-carousel
sourceType: javascript
options:
  - name: speed
    display: Speed
    type: text
    options: ''
  - name: direction
    display: Direction
    type: text
    options: ''
children: []
*/

{% set bpr %}
import InfiniteLooper from '@components/InfiniteLooper/InfiniteLooper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<InfiniteLooper
    {% if element.values.speed %}
      speed='{{ element.values.speed }}'
    {% endif %}
    {% if element.values.direction %}
      direction='{{ element.values.direction }}'
    {% endif %}
>   
    {{ content | raw }}
</InfiniteLooper>