/*
path: ActivityIndicator.tpl
keyPath: elements/15_Programming/Snippets/ActivityIndicator.tpl
unique_id: kCLnsFuT
type: file
icon: ico-field
sourceType: javascript
helpText: Renders a configurable React Native loading indicator
options:
  - name: className
    display: Style
    type: styles
    options: ''
  - name: color
    display: Color
    type: text
    options: ''
    settings:
      default: 'white'
  - name: size
    display: Size
    type: dropdown
    options: small;large
    settings:
      default: large
  - name: animating
    display: Animating?
    type: checkbox
    options: ''
    settings:
      default: false
  - name: hidesWhenStopped
    display: Hide When Stopped?
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
*/
{% set bpr %}
import { ActivityIndicator } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ActivityIndicator
  {% if element.values.animating %}animating{% endif %}
  color={{ element.values.color | default('white') | textOrVariable }}
  size={{ element.values.size | default('large') | textOrVariable }}
  {% if element.values.hidesWhenStopped %}hidesWhenStopped{% endif %}
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
/>
