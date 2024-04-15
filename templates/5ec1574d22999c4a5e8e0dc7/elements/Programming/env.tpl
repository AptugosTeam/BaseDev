/*
path: env.tpl
type: file
unique_id: a8Qgngnzr
icon: ico-google-analytics
sourceType: javascript
children: []
options:
  - name: code
    display: Env Body
    type: code
    options: ''
*/
{% set ENV %}
{{ element.values.code }}
{% endset %}
{{ add_setting('EnvFile', ENV) }}