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
    display: Message error
    type: text
    options: ''
  - name: codeCatch
    display: Code in Catch
    type: code
    options: ''
  - name: addFinally
    display: Add Finally Block
    type: checkbox
    default: false
    advanced: true
  - name: codeFinally
    display: Code in Finally
    type: code
    options: ''
    advanced: true
    showIf:
      addFinally: true
children: []
*/
try {
  {{ content | raw }}
} catch (e) {
  console.{{element.values.debuggingType|default('log')}}({% if element.values.messageError %} '{{ element.values.messageError }}', {% endif %} e)
  {{element.values.codeCatch | raw}}
}{% if element.values.addFinally %} finally {
  {{element.values.codeFinally | raw}}
}{% endif %}