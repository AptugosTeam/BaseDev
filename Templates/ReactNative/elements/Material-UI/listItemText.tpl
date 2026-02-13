/*
path: listItemText.tpl
type: file
unique_id: mUbB5LnI
icon: ico-list-item
sourceType: javascript
options:
  - name: text
    display: Text
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: secondaryText
    display: Secondary Text
    type: text
    options: ''
  - name: onClick
    display: On Click
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { List } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<List.Item
  title={{ element.values.text | textOrVariable }}
  {% if element.values.secondaryText %}description={{ element.values.secondaryText | textOrVariable }}{% endif %}
/>