/*
path: createStyleSheet.tpl
type: file
unique_id: crtStSD1
icon: ico-text
helpText: >-
  Create a stylesheet in the code
sourceType: javascript
options:
  - name: variable
    display: Define Variable
    type: text
    options: ''
  - name: styles
    display: Styles
    type: code
    options: ''
children: []
*/
{% set bpr %}
import { StyleSheet } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}

const {{ element.values.variable | default('styles') }} = StyleSheet.create({
    {{ element.values.styles | raw }}
})