/*
path: ServerCodeInjector.tpl
type: file
unique_id: skiSCijN
icon: ico-function
sourceType: javascript
helpText: Allows custom server-side code injection and supports child elements
options:
  - name: code
    display: Code
    type: code
    options: ''
children: []
*/
{% set serverCode %}
app.prepare().then(() => {
    {{ element.values.code | raw }}
    {{ content | raw }}
})
{% endset %}
{{ add_setting('serverCode', serverCode) }}