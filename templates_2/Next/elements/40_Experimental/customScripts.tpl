/*
path: customScripts.tpl
completePath: elements/Experimental/customScripts.tpl
unique_id: BvcT246s
children: []
icon: ico-google-analytics
helpText: Configure Custom Scripts into package.json
options:
  - name: code
    display: Config Body
    type: code
    options: ''
*/
{% set CUSTOMSCRIPTS %}
{{ element.values.code }}
{% endset %}
{{ add_setting('customScripts', CUSTOMSCRIPTS) }}