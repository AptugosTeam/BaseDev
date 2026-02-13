/*
path: injectHeadTag.tpl
type: file
unique_id: u8PZCVhs
icon: ico-google-analytics
deprecated: This element is not longer available as NextJS renders in server side
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
