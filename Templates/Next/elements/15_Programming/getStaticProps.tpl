/*
path: getStaticProps.tpl
type: file
unique_id: s9f0cGx1
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
import { GetStaticProps } from "next";
{% endset %}
{{ save_delayed('bpr',bpr) }}

export const getStaticProps: GetStaticProps = async (context) => {
  {% if element.values.content %}
    {{ element.values.content | raw }}
  {% endif %}
  {{ content | raw }}
}
