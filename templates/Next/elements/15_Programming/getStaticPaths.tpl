/*
path: getStaticPaths.tpl
type: file
unique_id: b2k9sHc4
icon: ico-seo
options:
  - name: content
    display: Content
    type: function
    options: ''
sourceType: javascript
children: []
*/
{% set bpr %}
import { GetStaticPaths } from "next";
{% endset %}
{{ save_delayed('bpr',bpr) }}

export const getStaticPaths: GetStaticPaths = async () => {
  {% if element.values.content %}
    {{ element.values.content | raw }}
  {% endif %}
  {{ content | raw }}
}
