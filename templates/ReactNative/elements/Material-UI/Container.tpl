/*
path: Container.tpl
type: file
unique_id: 3NDAATVX
icon: ico-field
helpText: >-
  The container centers your content horizontally. It's the most basic layout
  element.
options:
  - name: className
    display: className
    type: text
    options: ''
sourceType: javascript
children: []
*/
<SafeAreaView 
  {% if element.values.className %}
    style={ {{element.values.className}} }
  {% endif %}
>
  {{ content | raw }}
</SafeAreaView>