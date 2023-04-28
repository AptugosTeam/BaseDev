/*
path: html.tpl
type: file
unique_id: 3ZM4gz8X
icon: f:html.svg
sourceType: javascript
options:
  - name: html
    display: Content
    type: text
    options: ''
settings:
  - name: Packages
    value: '"html-react-parser": "3.0.16",'
children: []
*/
{% set bpr %}
import parser from 'html-react-parser'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{ parser (`${ {{ element.values.html | raw }} }{{ content | raw }}`) }