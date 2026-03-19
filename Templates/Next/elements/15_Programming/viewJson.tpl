/*
path: viewJson.tpl
type: file
unique_id: ctUV2ETz
icon: f:viewJson.svg
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
import { lazy } from "react"
const LazyReactJson = lazy(() => import("react-json-view"))
{% endset %}
{{ save_delayed('bpr', bpr) }}
<LazyReactJson src={{ element.values.jsonObject | textOrVariable }} />
