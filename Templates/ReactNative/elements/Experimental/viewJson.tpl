/*
path: viewJson.tpl
type: file
unique_id: ctUV2ETz
icon: ico-field
children: []
completePath: elements/Experimental/viewJson.tpl
settings:
  - name: Packages
    value: '"react-json-view": "^1.21.3",'
options:
  - name: jsonObject
    display: JSON Object
    type: text
*/
{% set bpr %}
import ReactJson from 'react-json-view'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<ReactJson src={{ element.values.jsonObject | textOrVariable }} />
