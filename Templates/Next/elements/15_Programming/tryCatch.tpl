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
  - name: useChildrenAsBlocks
    display: Use children as try / catch / finally
    type: checkbox
    options: ''
children: []
*/
try {
  {% if element.values.useChildrenAsBlocks %}
    {{ element.children[0].rendered | raw }}
  {% else %}
    {{ content | raw }}
  {% endif %}
} catch (e) {
  // catch part
  {% if element.values.useChildrenAsBlocks %}
    {% if element.children[1] %}
      {{ element.children[1].rendered | raw }}
    {% else %}
      console.log({% if element.values.messageError %} '{{ element.values.messageError }}', {% endif %} e)
    {% endif %}
  {% elseif element.values.catchContent %} 
    {{ element.values.catchContent | raw }}
  {% else %}
    console.log({% if element.values.messageError %} '{{ element.values.messageError }}', {% endif %} e)
  {% endif %}
}{% if element.values.useChildrenAsBlocks and element.children[2] %} finally {
  {{ element.children[2].rendered | raw }}
}{% endif %}