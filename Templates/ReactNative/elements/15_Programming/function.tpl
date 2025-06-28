/*
path: function.tpl
type: file
unique_id: r0mQRZ4N
icon: ico-function
sourceType: javascript
helpText: Prepares a function to be called by other components and actions
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
  - name: functionParameters
    display: Parameters
    type: text
    options: ''
  - name: functionBody
    display: Body
    type: function
    options: ''
  - name: priority
    display: Priiority
    type: dropdown
    options: Normal;High;Low
  - name: async
    display: Async
    type: checkbox
    advanced: true
    settings:
      default: false
children: []
*/
{% set parentElement = element.parent | elementData %}  
{% if parentElement.value == 'class' %}
  {% if element.values.functionName == 'constructor' %}constructor{% else %}public {% if element.values.static %}static {% endif %}{{element.values.functionName}}{% endif %} ({{ element.values.functionParameters }}) {
    {{ element.values.functionBody | raw }}
    {{ content | raw }}  
  }
{% else %}
  {% set functionContent %}
    const {{ element.values.functionName }} = {% if element.values.async%}async{% endif %} ({{ element.values.functionParameters }}) => {
      {{ element.values.functionBody | raw }}
      {{ content | raw }}  
    }
  {% endset %}
  {% if element.values.renderElsewhere and element.values.renderElsewhere != 'inPlace' %}
    {{ add_setting(element.values.renderElsewhere, functionContent) }}
  {% else %}
    {{ functionContent }}
  {% endif %}
{% endif %}


