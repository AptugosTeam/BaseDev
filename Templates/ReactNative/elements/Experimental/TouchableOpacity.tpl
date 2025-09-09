/*
path: TouchableOpacity.tpl
type: file
unique_id: tOi87apk
icon: ico-button
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: activeOpacity
    display: Opacity
    type: text
    options: ''
  - name: onPress
    display: On Press
    type: code
    options: ''
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    settings:
      active: true
children: []
*/
{% set bpr %}
import { TouchableOpacity } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}

<TouchableOpacity
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.activeOpacity %}activeOpacity={ {{ element.values.activeOpacity}} }{% endif %}
  {% if element.values.labelStyle %}labelStyle={ {{ element.values.labelStyle }} }{% endif %}
  {% if element.values.icon %}icon={ '{{ element.values.icon }}' }{% endif %}
  {% if element.values.onPress %}onPress={ {{ element.values.onPress | functionOrCall }} }{% endif %}
  {% if element.values.disabled %}disabled={ {{element.values.disabled}} }{% endif %}
>
{{ content | raw }}
</TouchableOpacity>