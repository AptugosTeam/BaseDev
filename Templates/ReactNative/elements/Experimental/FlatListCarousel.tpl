/*
path: FlatListCarousel.tpl
type: file
unique_id: FLCi17apk
icon: ico-carousel
sourceType: javascript
settings:
  - name: Packages
    value: ''
options:
  - name: width
    display: Width
    type: text
    options: ''
  - name: height
    display: Height
    type: text
    options: ''
  - name: style
    display: Style
    type: text
    options: ''
  - name: data
    display: Data
    type: text
    options: ''
  - name: horizontal
    display: Horizontal Scroll?
    type: checkbox
    options: ''
    settings:
      default: true
  - name: pagingEnabled
    display: Enable Paging?
    type: checkbox
    options: ''
  - name: snapToInterval
    display: Snap To Interval
    type: text
    options: ''
  - name: onSnapToItem
    display: On Snap To Item
    type: function
    options: ''
  - name: renderItem
    display: Render Item Props
    type: text
    options: ''
  - name: code
    display: Code
    type: function
    options: ''
  - name: ref
    display: Use Reference
    type: text
    options: ''
children: []
*/

{% set bpr %}
import { FlatList } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}

<FlatList
  {% if element.values.ref %}
    ref={ {{ element.values.ref }} }
  {% endif %}
  {% if element.values.data %}
    data={ {{element.values.data}} }
  {% endif %}
  keyExtractor={(item, index) => index.toString()}
  {% if element.values.horizontal %}
    horizontal
  {% endif %}
  showsHorizontalScrollIndicator={false}
  {% if element.values.pagingEnabled %}
    pagingEnabled
  {% endif %}
  {% if element.values.snapToInterval %}
    snapToInterval={ {{ element.values.snapToInterval }} }
  {% endif %}
  decelerationRate="fast"
  renderItem={({ item, index }) => {
    {% if element.values.code %}
      {{element.values.code}}
      return (
        {{ content | raw }}
      )
    {% else %}
      return (
        {{ content | raw }}
      )
    {% endif %}
  }}
  {% if element.values.onSnapToItem %}
    onMomentumScrollEnd={(ev) => {
      const index = Math.round(ev.nativeEvent.contentOffset.x / {{ element.values.snapToInterval | default('1') }});
      {{ element.values.onSnapToItem }}(index);
    }}
  {% endif %}
/>
