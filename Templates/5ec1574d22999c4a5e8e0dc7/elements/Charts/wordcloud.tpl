/*
path: wordCloud.tpl
completePath: elements/Experimental/Charts/wordCloud.tpl
type: file
unique_id: 5l4alsdkmn
icon: f:ComposedChart.svg
settings:
  - name: Packages
    value: '"visx/group": "^2.17.0",'
  - name: Packages
    value: '"visx/scale": "^2.17.0",'
  - name: Packages
    value: '"visx/text": "^2.17.0",'
  - name: Packages
    value: '"visx/wordcloud": "^2.17.0",'
options:
  - name: words
    display: Words to use in the cloud
    type: text
    options: ''
  - name: width
    display: Cloud width (in pixels)
    type: text
    options: ''
  - name: height
    display: Cloud height (in pixels)
    type: text
    options: ''
  - name: font
    display: Font to use
    type: text
    options: ''
  - name: fontSize
    display: font Size
    type: text
    options: ''
  - name: padding
    display: Padding between words
    type: text
    options: ''
  - name: spiral
    display: Spiral of words
    type: dropdown
    options: archimedean;rectangular
  - name: rotate
    display: rotate
    type: text
    options: ''
  - name: random
    display: random
    type: text
    options: ''
  - name: colors
    display: Colors array (variable)
    type: text
    options: ''
  - name: textAnchor
    display: Text anchor
    type: dropdown
    options: start;middle;end
  - name: className
    display: ClassName
    type: styles
    options: ''
children: []
*/
{% set bpr %}
import { Text } from '@visx/text'
import { scaleLog } from '@visx/scale'
import { Wordcloud } from '@visx/wordcloud'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Wordcloud
  words={ {{ element.values.words | default('[]') }} }
  width={ {{ element.values.width | default(800) }} }
  height={ {{ element.values.height | default(400) }} }
  {% if element.values.font %}font="{{ element.values.font }}"{% endif %}
  {% if element.values.padding %}padding={ {{ element.values.padding }} }{% endif %}
  {% if element.values.spiral %}spiral="{{ element.values.spiral }}"{% endif %}
  fontSize={ {{ element.values.fontSize | default(24) }} }
  {% if element.values.rotate %}rotate={ {{ element.values.rotate }} }{% endif %}
  random={ {{ element.values.random | default('Math.random') }} }
>
  {(cloudWords) =>
    cloudWords.map((w, i) => (
      <Text
        key={w.text}
        fill={ ({{ element.values.colors | default("['#143059','#2F6B9A','#82a6c2','#7C4DFF','#E63946']") }})[i % ({{ element.values.colors | default("['#143059','#2F6B9A','#82a6c2','#7C4DFF','#E63946']") }}).length] }
        textAnchor="{{ element.values.textAnchor | default('middle') }}"
        transform={`translate(${w.x}, ${w.y})`}
        fontSize={w.size}
        fontFamily={w.font}
        {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
      >
        {w.text}
      </Text>
    ))
  }
</Wordcloud>
