/*
path: meta.tpl
type: file
unique_id: s7x9rTv3
icon: ico-seo
options:
  - name: title
    display: Meta Title
    type: text
    options: ''
  - name: description
    display: Meta Description
    type: text
    options: ''
  - name: canonical
    display: Canonical URL
    type: text
    options: ''
  - name: favicon
    display: Favicon
    type: text
    options: ''
  - name: robots
    display: Robots Tag
    type: text
    options: ''
  - name: ogtitle
    display: Open Graph Title 
    type: text
    options: ''
  - name: ogdescription
    display: Open Graph Description
    type: text
    options: ''
  - name: ogurl
    display: Open Graph Canonical URL
    type: text
    options: ''
  - name: ogimage
    display: Open Graph Image
    type: text
    options: ''
  - name: twTitle
    display: Twitter Meta Title
    type: text
    options: ''
  - name: twDescription
    display: Twitter Meta Description
    type: text
    options: ''
  - name: twImage
    display: Twitter Meta Image
    type: text
    options: ''
  - name: extraContent
    display: Extra Content
    type: function
    options: ''
sourceType: javascript
children: []
*/
{% set bpr %}
import Head from 'next/head'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set headContent %}
{% if element.values.title %}<title>{{ element.values.title }}</title>{% endif %}
{% if element.values.description %}<meta name="description" content={{ element.values.description | textOrVariable }} />{% endif %}
{% if element.values.canonical %}<link rel="canonical" href={{ element.values.canonical | textOrVariable }} />{% endif %}
{% if element.values.robots %}<meta name="robots" content={{ element.values.robots | textOrVariable }} />{% endif %}
{% if element.values.twTitle %}<meta name="twitter:title" content={{ element.values.twTitle | textOrVariable }} />{% endif %}
{% if element.values.twDescription %}<meta name="twitter:description" content={{ element.values.twDescription | textOrVariable }} />{% endif %}
{% if element.values.twImage %}<meta name="twitter:image" content={{ element.values.twImage | textOrVariable }} />{% endif %}
{% if element.values.ogtitle %}<meta name="title" property="og:title" content={{ element.values.ogtitle | textOrVariable }} />{% endif %}
{% if element.values.ogdescription %}<meta name="description" property="og:description" content={{ element.values.ogdescription | textOrVariable }} />{% endif %}
{% if element.values.ogurl %}<meta name="og:url" content={{ element.values.ogurl | textOrVariable }} />{% endif %}
{% if element.values.ogimage %}<meta name="image" property="og:image" content={{ element.values.ogimage | textOrVariable }}></meta>{% endif %}
{% if element.values.favicon %}<link rel="icon" href={{ element.values.favicon | textOrVariable }} />{% else %}<link rel="icon" href="/img/favicon.png" />{% endif %}
{% if element.values.extraContent %} {{ element.values.extraContent }} {% endif %}
{% endset %}
{{ set_setting('HeadContent', headContent) }}
