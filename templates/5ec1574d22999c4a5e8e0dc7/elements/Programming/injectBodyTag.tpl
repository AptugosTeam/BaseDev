/*
path: injectBodyTag.tpl
type: file
unique_id: 2RFDVsz
icon: ico-google-analytics
options:
  - name: codeToInject
    display: Code to inject
    type: function
    options: ''
sourceType: javascript
children: []
*/
{% set IBA %}
{{ element.values.codeToInject }}
{% endset %}
{{ add_setting('IndexPageAdd', IBA) }}
// Google Analytics Track
