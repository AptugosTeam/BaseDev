/*
path: htaf.tpl
type: file
unique_id: a8Qmrrnzr
icon: ico-google-analytics
sourceType: javascript
children: []
options:
  - name: code
    display: HtAccess Body
    type: code
    options: ''
*/
{% set HTAF %}
{{ element.values.code }}
{% endset %}
{{ add_setting('htaccessFile', HTAF) }}