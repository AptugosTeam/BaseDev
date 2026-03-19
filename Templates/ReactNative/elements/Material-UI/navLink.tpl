/*
path: navLink.tpl
type: file
unique_id: RDDUIuWL
icon: ico-navlink
sourceType: javascript
options:
  - name: destination
    display: Destination
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: activeClassname
    display: ClassName (active)
    type: text
    options: ''
  - name: linkText
    display: Text
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { Link } from "react-router-native"
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { Text } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Link
    to={{ element.values.destination|textOrVariable }}
    key='{{ element.unique_id }}'
>
  <Text>{{ element.values.linkText }}</Text>
  {{ content | raw }}
</Link>
