/*
path: ReanimatedCarousel.tpl
type: file
unique_id: RCi17apk
icon: ico-carousel
sourceType: javascript
settings:
  - name: Packages
    value: '"react-native-reanimated-carousel": "^3.5.1","react-native-gesture-handler": "2.12.0",'
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
  - name: scrollAnimationDuration
    display: Scroll Animation Duration
    type: text
    options: ''
  - name: pagingEnabled
    display: Enable Paging?
    type: checkbox
    options: ''
  - name: snapEnabled
    display: Enable Snap?
    type: checkbox
    options: ''
  - name: loop
    display: Disable Loop?
    type: checkbox
    options: ''
    settings:
      default: 'false'
  - name: autoplay
    display: Enable Autoplay?
    type: checkbox
    options: ''
    settings:
      default: false
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
import { Dimensions } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import Carousel from 'react-native-reanimated-carousel'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Carousel
    {% if element.values.ref %}
    ref={ {{ element.values.ref }} }
    {% endif %}
    width={ {{element.values.width }} }
    height={ {{element.values.height | default('width' / 2) }} }
    {% if element.values.style %}
      style={ {{element.values.style}} }
    {% endif %}
    {% if element.values.data %}
      data={ {{element.values.data}} }
    {% endif %}
    {% if element.values.scrollAnimationDuration %}
      scrollAnimationDuration={ {{element.values.scrollAnimationDuration}} }
    {% endif %}
    {% if element.values.pagingEnabled %}
      pagingEnabled
    {% endif %}
    {% if element.values.snapEnabled %}
      snapEnabled
    {% endif %}
    {% if element.values.loop %}
      loop={false}
    {% endif %}
    {% if element.values.autoplay %}
      autoPlay
    {% endif %}
    {% if element.values.onSnapToItem %}
      onSnapToItem={(index) => {{ element.values.onSnapToItem }}}
    {% endif %}
    {% if not element.values.code %}
      renderItem={({ {{element.values.renderItem | default('index')}} }) => (
      {{ content | raw }}
    )}
    {% else %}
      renderItem={({ {{element.values.renderItem | default('index')}} }) => {
        {{element.values.code}}
        return (
      {{ content | raw }}
    )}}
    {% endif %}
/>