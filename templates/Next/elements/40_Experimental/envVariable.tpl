/*
path: envVariable.tpl
completePath: elements/Experimental/envVariable.tpl
unique_id: VgfG926h
children: []
icon: ico-google-analytics
helpText: Configure Enviaronment Variables
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