/*
path: tryCatch.tpl
type: file
unique_id: zi5p8ljK
icon: 
sourceType: javascript
options:
  - name: debuggingType
    display: Debugging Message Type
    type: dropdown
    options: log;error;warn
  - name: messageError
    display: Message
    type: text
    options: ''
  - name: codeCatch
    display: Code in Catch
    type: code
    options: ''
children: []
*/
try {
  {{ content | raw }}
} catch (e) {
  console.{{element.values.debuggingType|default('log')}}({% if element.values.messageError %} '{{ element.values.messageError }}', {% endif %} e)
  {{element.values.codeCatch | raw}}
}