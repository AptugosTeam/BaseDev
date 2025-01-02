/*
path: injectHeadTag.tpl
type: file
unique_id: u8PZCVhs
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
{{ add_setting('IndexBodyAddTop', IBA) }}
// Google Analytics Track
