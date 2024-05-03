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
children: []
*/
try {
  {{ content | raw }}
} catch (e) {
  console.log({% if element.values.messageError %} '{{ element.values.messageError }}', {% endif %} e)
}