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
  - name: catchContent
    display: Catch content
    type: function
    options: ''
children: []
*/
try {
  {{ content | raw }}
} catch (e) {
  {% if element.values.catchContent %} 
    {{ element.values.catchContent | raw }}
  {% else %}
    console.log({% if element.values.messageError %} '{{ element.values.messageError }}', {% endif %} e)
  {% endif %}
}