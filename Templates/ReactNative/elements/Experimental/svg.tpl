/*
path: svg.tpl
type: file
unique_id: svg123xyz
options:
  - name: width
    display: Width
    type: text
    options: ''
  - name: height
    display: Height
    type: text
    options: ''
  - name: viewBox
    display: ViewBox
    type: text
    options: ''
  - name: fill
    display: Fill Color
    type: text
    options: ''
  - name: style
    display: Style
    type: text
    options: ''
  - name: d
    display: Path Data (d)
    type: text
    options: ''
  - name: preserveAspectRatio
    display: Preserve Aspect Ratio
    type: text
    options: ''
sourceType: javascript
children: []
helpText: Renders a customizable SVG component.
*/
{% set bpr %}
  import Svg, { Path } from 'react-native-svg'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Svg
  {% if element.values.width %}width={ {{ element.values.width }} }{% endif %}
  {% if element.values.height %}height={ {{ element.values.height }} }{% endif %}
  {% if element.values.viewBox %}viewBox={ {{ element.values.viewBox | textOrVariable }} }{% endif %}
  {% if element.values.style %}style={ {{ element.values.style }} }{% endif %}
  {% if element.values.preserveAspectRatio %}preserveAspectRatio="{{ element.values.preserveAspectRatio }}"{% endif %}

>
    <Path
    {% if element.values.d %}d={{ element.values.d | textOrVariable }}{% endif %}
    fill={{ element.values.fill | textOrVariable }}
    />
</Svg>