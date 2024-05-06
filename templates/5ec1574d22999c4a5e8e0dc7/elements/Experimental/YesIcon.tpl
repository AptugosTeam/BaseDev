/*
path: YesIcon.tpl
completePath: elements/Experimental/YesIcon.tpl
type: file
unique_id: UiCt6AJV
icon: f:YesIcon.svg
sourceType: javascript
children: []
options:
  - name: icon
    display: Icon
    type: text
    options: ''
  - name: fontSize
    display: Font Size
    type: text
    options: ''
  - name: color
    display: Color (in hexadecimal)
    type: text
    options: ''
settings:
  - name: Packages
    value: '"@iconify/react": "^4.1.1",'
*/
{% set bpr %}
import { Icon as YesIcon} from '@iconify/react'
{% endset %}
{{ save_delayed('bpr',bpr) }}
  <YesIcon
  {% if element.values.icon %}
  icon={{ element.values.icon | textOrVariable }}
  {% endif %}
  {% if element.values.fontSize or element.values.color %}
    style={ { {% if element.values.fontSize %} fontSize: '{{element.values.fontSize}}', {% endif %} {% if element.values.color %} color: '{{element.values.color}}' {% endif %} } }
  {% endif %}
/>