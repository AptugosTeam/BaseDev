/*
path: meta.tpl
type: file
unique_id: s7x9rTv3
icon: ico-meta
options:
  - name: title
    display: Title
    type: text
    options: ''
  - name: description
    display: description
    type: text
    options: ''
  - name: ogtitle
    display: OG:Title
    type: text
    options: ''
  - name: ogimage
    display: OG:Image
    type: text
    options: ''
  - name: ogdescription
    display: OG:Description
    type: text
    options: ''
  - name: ogurl
    display: OG:URL
    type: text
    options: ''
sourceType: javascript
children: []
*/

{% set bpr %}
import Head from 'next/head'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Head>
{% if element.values.title %}<title>{{ element.values.title }}</title>{% endif %}
{% if element.values.description %}<meta name="description" content={{ element.values.description | textOrVariable }} />{% endif %}
{% if element.values.ogtitle %}<meta name="title" property="og:title" content={{ element.values.ogtitle | textOrVariable }} />{% endif %}
{% if element.values.ogimage %}<meta name="image" property="og:image" content={{ element.values.ogimage | textOrVariable }}></meta>{% endif %}
{% if element.values.ogurl %}<meta name="og:url" content={{ element.values.ogurl | textOrVariable }} />{% endif %}
<link rel="icon" href="/img/favicon.png" />
</Head>
