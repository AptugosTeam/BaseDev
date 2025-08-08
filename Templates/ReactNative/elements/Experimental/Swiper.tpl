/*
path: Swiper.tpl
type: file
unique_id: rDl8cgP7
icon: ico-carousel
options:
  - name: style
    display: Style
    type: text
    options: ''
  - name: showsPagination
    display: Show Pagination
    type: checkbox
    options: ''
  - name: loop
    display: Loop Slides
    type: checkbox
    options: ''
  - name: dot
    display: Dot Style Component
    type: code
    options: ''
  - name: activeDot
    display: Active Dot Style Component
    type: code
    options: ''
  - name: onIndexChanged
    display: On Index Changed
    type: code
    options: ''
  - name: autoplay
    display: Autoplay
    type: checkbox
    options: ''
  - name: autoplayTimeout
    display: Autoplay Timeout (seconds)
    type: text
    options: ''
  - name: index
    display: Initial Index
    type: text
    options: ''
  - name: horizontal
    display: Horizontal
    type: checkbox
    options: ''
sourceType: javascript
children: []
helpText: Displays a swipeable carousel using react-native-swiper.
*/
{% set bpr %}
  import Swiper from 'react-native-swiper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Swiper
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
  {% if element.values.loop %}loop={true}{% endif %}
  {% if element.values.dot %}dot={ {{ element.values.dot }} }{% else %}dot={<View style={theme.dot} />}{% endif %}
  {% if element.values.activeDot %}activeDot={ {{ element.values.activeDot }} }{% else %}activeDot={<View style={theme.activeDot} />}{% endif %}
  {% if element.values.onIndexChanged %}
    onIndexChanged={ {{ element.values.onIndexChanged | functionOrCall }} }
  {% endif %}
  {% if element.values.showsPagination %}showsPagination={true}{% endif %}
  {% if element.values.autoplay %}autoplay={true}{% endif %}
  {% if element.values.autoplayTimeout %}autoplayTimeout={ {{element.values.autoplayTimeout}} }{% endif %}
  {% if element.values.index %}index={ {{element.values.index}} }{% endif %}
  {% if element.values.horizontal %}horizontal={true}{% endif %}
>
{{ content | raw }}
</Swiper>