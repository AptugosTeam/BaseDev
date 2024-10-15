/*
path: ScrollIntoView.tpl
completePath: elements/Experimental/ScrollIntoView.tpl
type: file
unique_id: sivAV001
options:
  - name: document
    display: Item ID (without '#' )
    type: text
    options: ''
  - name: time
    display: Time (in milliseconds)
    type: text
    options: ''
  - name: align
    display: Do you want to use align?
    type: checkbox
    options: ''
  - name: top
    display: Top
    type: text
    options: ''
    settings:
      propertyCondition: align
      condition: true
  - name: left
    display: Left
    type: text
    options: ''
    settings:
      propertyCondition: align
      condition: true
  - name: topOffset
    display: topOffset
    type: text
    options: ''
    settings:
      propertyCondition: align
      condition: true
settings:
  - name: Packages
    value: '"scroll-into-view": "^1.16.2",'
children: []
*/
{% set bpr %}
import scrollIntoView from 'scroll-into-view'
{% endset %}
{{ save_delayed('bpr',bpr) }}
const element = document.querySelector(`#{{element.values.document}}`);
    if (element) {
      scrollIntoView(element, {
        time: {{ element.values.time | default(2500) }},
        {% if element.values.align %}
            align:{ 
              top: {{ element.values.top | default(0.5) }},
              left: {{ element.values.left | default(0.5) }},
              topOffset: {{ element.values.topOffset | default(0) }},     
            }
        {% endif %} 
        }) 
    }
