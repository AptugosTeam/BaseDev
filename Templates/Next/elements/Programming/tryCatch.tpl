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
  - name: return
    display: Return after catch message
    type: checkbox
    settings:
      default: false
children: []
*/
try {
  {{ content | raw }}
} catch (e) {
  console.log({% if element.values.messageError %} '{{ element.values.messageError }}', {% endif %} e)
  {% if element.values.return %}return{% endif %}
}