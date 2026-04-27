/*
path: function.tpl
type: file
unique_id: r0mQRZ4N
icon: ico-function
sourceType: javascript
helpText: Defines a reusable function that can be called from other components, handlers, hooks, or actions in the generated React Native code
options:
  - name: functionName
    display: Function Name
    helpText: Name of the generated function. Required unless the function is intentionally anonymous.
    type: text
    options: ''
  - name: functionParameters
    display: Parameters
    helpText: Comma-separated parameter list used in the function signature, for example value, index or event
    type: text
    options: ''
  - name: functionBody
    display: Body
    helpText: Raw code inserted at the beginning of the function body before child content is rendered
    type: function
    options: ''
  - name: priority
    display: Priiority
    helpText: Optional execution priority metadata used by the builder or editor
    type: dropdown
    options: Normal;High;Low
  - name: async
    display: Async
    helpText: Adds the async keyword so the function can await asynchronous work
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: anonymous
    display: Anonymous function
    helpText: Generates an anonymous arrow function instead of assigning it to a named constant
    type: checkbox
    advanced: true
    settings:
      default: false
children: []
*/
{% set parentElement = element.parent | elementData %}  
{% if parentElement.value == 'class' %}
  {% if element.values.functionName == 'constructor' %}constructor{% else %}public {% if element.values.static %}static {% endif %}{% if element.values.async%}async {% endif %}{{element.values.functionName}}{% endif %} ({{ element.values.functionParameters }}) {
    {{ element.values.functionBody | raw }}
    {{ content | raw }}  
  }
{% else %}
  {% set functionContent %}
    {% if not element.values.anonymous %}const {{ element.values.functionName }} = {% endif %}{% if element.values.async%}async{% endif %} ({{ element.values.functionParameters }}) => {
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

