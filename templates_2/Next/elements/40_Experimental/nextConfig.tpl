/*
path: nextConfig.tpl
completePath: elements/Experimental/nextConfig.tpl
unique_id: KnlJ058j
children: []
icon: ico-google-analytics
helpText: Configure Next.js Config Variables
options:
  - name: code
    display: Config Body
    type: code
    options: ''
*/
{% set NXTCONF %}
{{ element.values.code }}
{% endset %}
{{ add_setting('NextConfig', NXTCONF) }}