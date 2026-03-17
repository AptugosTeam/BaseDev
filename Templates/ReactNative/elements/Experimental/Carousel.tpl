/*
path: Carousel.tpl
type: file
unique_id: oKi37bpk
icon: ico-carousel
sourceType: javascript
settings:
  - name: Packages
    value: '"react-native-animated-scroll-indicators": "^1.0.1",'
options:
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: numberOfCards
    display: Number of Cards
    type: text
    options: ''
  - name: width
    display: Width
    type: text
    options: ''
  - name: activeColor
    display: Active Color
    type: text
    options: ''
  - name: inActiveColor
    display: Inactive Color
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { Animated } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import RNAnimatedScrollIndicators from 'react-native-animated-scroll-indicators'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
let scrollX = new Animated.Value(0)
{% endset %}
{{ save_delayed('ph', ph) }}
<View {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}>
  <Animated.ScrollView
    horizontal
    pagingEnabled
    showsHorizontalScrollIndicator={false}
    contentContainerStyle={ { flexGrow: 1 } }
    onScroll={Animated.event(
      [{ nativeEvent: { contentOffset: { x: scrollX } } }],
      { useNativeDriver: true }
    )}
  >
    {{ content | raw }}
  </Animated.ScrollView>
</View>
<View {% if element.values.className %}style={ {{ element.values.className ~ 'dotsContainer' }} }{% endif %}>
  <RNAnimatedScrollIndicators
    numberOfCards={ {{ element.values.numberOfCards }} }
    scrollWidth={ {{ element.values.width }} }
    activeColor={{ element.values.activeColor | default('#7C9BFF') | textOrVariable }}
    inActiveColor={{ element.values.inActiveColor | default('#5570C9') | textOrVariable }}
    scrollAnimatedValue={scrollX}
  />
</View>