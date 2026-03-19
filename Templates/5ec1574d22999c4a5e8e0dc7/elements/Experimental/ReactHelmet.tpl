/*
path: ReactHelmet.tpl
type: file
unique_id: RHALV001
icon: f:QR_icon.svg
options:
  - name: title
    display: Title
    type: text
    options: ''
  - name: charset
    display: Meta charSet
    type: text
    options: ''
sourceType: javascript
children: []
settings:
  - name: Packages
    value: '"react-helmet": "^6.1.0",'
*/
{% set bpr %}
import { Helmet } from "react-helmet"
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Helmet>
    {% if element.values.title %}
        <title>{{element.values.title}}</title>
    {% endif %}
    {% if element.values.title %}
        <meta charSet="{{element.values.charset}}" />
    {% endif %}
{{ content | raw }}
</Helmet>

