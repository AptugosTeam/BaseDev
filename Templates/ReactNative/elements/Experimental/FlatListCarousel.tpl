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
  - name: keyExtractor
    display: Key Extractor
    type: text
    options: ''
  - name: decelerationRate
    display: Deceleration Rate
    type: text
    options: ''
  - name: itemSeparatorStyle
    display: Item Separator Style
    type: text
    options: ''
  - name: maxToRenderPerBatch
    display: maxToRenderPerBatch
    type: text
  - name: initialNumToRender
    display: initialNumToRender
    type: text
  - name: windowSize
    display: windowSize
    type: text
  - name: removeClippedSubviews
    display: removeClippedSubviews
    type: checkbox
    options: ''

children: []
*/

{% set bpr %}
import { FlatList, View } from 'react-native'  
{% endset %}
{{ save_delayed('bpr', bpr) }}

<FlatList
  {% if element.values.style %}
    style={ {{element.values.style}} }
  {% endif %}
  {% if element.values.ref %}
    ref={ {{ element.values.ref }} }
  {% endif %}
  {% if element.values.data %}
    data={ {{element.values.data}} }
  {% endif %}

  {% if element.values.keyExtractor %}
    keyExtractor={ {{element.values.keyExtractor}} }
  {% else %}
    keyExtractor={(item, index) => index.toString()}
  {% endif %}

  {% if element.values.horizontal %}
    horizontal
  {% endif %}
  showsHorizontalScrollIndicator={false}
  {% if element.values.pagingEnabled %}
    pagingEnabled
  {% endif %}
  {% if element.values.snapToInterval %}
    snapToInterval={ {{element.values.snapToInterval}} }
  {% endif %}
  {% if element.values.decelerationRate %}
    decelerationRate={ {{element.values.decelerationRate}} }
  {% else %}
    decelerationRate="fast"
  {% endif %}
    {% if element.values.maxToRenderPerBatch %}
    maxToRenderPerBatch={ {{element.values.maxToRenderPerBatch}} }
    {% endif %}
  {% if element.values.initialNumToRender %}
  initialNumToRender={ {{element.values.initialNumToRender}} }
  {% endif %}
  {% if element.values.windowSize %}
  windowSize={ {{element.values.windowSize}} }
  {% endif %}
  {% if element.values.removeClippedSubviews %}
  removeClippedSubviews={true}
  {% endif %}
  {% if element.values.itemSeparatorStyle %}
    ItemSeparatorComponent={() => <View style={ {{element.values.itemSeparatorStyle}} } />}
  {% endif %}

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
