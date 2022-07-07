/*
path: html.tpl
type: file
unique_id: 3ZM4gz8X
icon: ico-field
sourceType: javascript
options:
  - name: html
    display: Content
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-html-parser": "^2.0.2",'
children: []
*/
{% set bpr %}
import ReactHtmlParser from 'react-html-parser'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{ ReactHtmlParser ({{ element.values.html | raw }}{{ content | raw }}) }