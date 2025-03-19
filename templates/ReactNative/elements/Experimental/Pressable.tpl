/*
path: Pressable.tpl
type: file
unique_id: d2a77zvb
icon: ico-button
sourceType: javascript
options:
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: onPress
    display: On Press
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { Pressable } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr) }}

<Pressable
  {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
  {% if element.values.onPress %}onPress={ {{ element.values.onPress | functionOrCall }} }{% endif %}
>
{{ content | raw }}
</Pressable>