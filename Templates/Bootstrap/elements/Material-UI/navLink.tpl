/*
path: navLink.tpl
type: file
unique_id: RDDUIuWL
icon: ico-navlink
sourceType: javascript
options:
  - name: Destination
    display: destination
    type: text
    options: ''
  - name: destination
    display: Destination
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: activeClassname
    display: ClassName (active)
    type: styles
    options: ''
  - name: linkText
    display: Text
    type: text
    options: ''
children: []
*/
{% set bpr %}
import Link from 'next/link'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Link href={{ element.values.destination|textOrVariable }}>
  {% if element.values.linkText %}{{ element.values.linkText }}{% endif %}
  {{ content | raw }}
</Link>
