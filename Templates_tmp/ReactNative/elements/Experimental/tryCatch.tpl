/*
path: tryCatch.tpl
type: file
unique_id: zi5p8ljK
icon: 
sourceType: javascript
options:
  - name: messageError
    display: Message error
    type: text
    options: ''
  - name: debugType
    display: Debug Type
    type: dropdown
    options: log;warn;error;info;debug
    settings:
      default: log
  - name: catchContent
    display: Catch Content
    type: code
    options: ''
children: []
*/
try {
  {{ content | raw }}
} catch (e) {
  {% if element.values.messageError %}
  console.{{ element.values.debugType|default('log') }}('{{ element.values.messageError }}', e)
  {% endif %}
  {{ element.values.catchContent | raw }}
}