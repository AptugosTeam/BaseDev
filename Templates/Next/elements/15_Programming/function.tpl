/*
path: function.tpl
type: file
unique_id: r0mQRZ4N
icon: ico-function2
sourceType: javascript
holder: true
order: 5
helpText: Defines a reusable JavaScript or TypeScript function. When used inside a class, it can render either as a classic class method or as a class property initialized with an arrow function. When used outside a class, it can render as an arrow function or as a classic function declaration/expression.
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
    helpText: Name of the function or method. Required for class methods and class arrow properties. Outside classes, it is required for named functions and optional only for anonymous classic functions.
  - name: functionParameters
    display: Parameters
    type: text
    options: ''
    helpText: Comma-separated parameter list used in the function signature. Example req, res or value, index.
  - name: functionBody
    display: Body
    type: function
    options: ''
    helpText: Raw code inserted at the beginning of the generated function body before rendering child content.
  - name: renderElsewhere
    display: Render Elsewhere
    type: dropdown
    options: >-
      return [ ['inPlace','Render in place'],
      ...aptugo.store.getState().application.tables.map(({ unique_id, singleName }) => [
      aptugo.pageUtils.friendly(singleName).toLowerCase() + '_File_Start',
      'Begining of endpoints for ' + singleName
      ]) ]
    advanced: true
    helpText: Optional alternate render target. Use this when the function should be emitted into a different generated section instead of the current location.
  - name: async
    display: Async
    type: checkbox
    advanced: true
    settings:
      default: false
    helpText: Adds the async keyword to the generated function.
  - name: static
    display: Static
    type: checkbox
    advanced: true
    settings:
      default: false
    helpText: Only applies inside classes. Generates a static class method or static class arrow property.
  - name: anonymous
    display: Anonymous function
    type: checkbox
    advanced: true
    settings:
      default: false
    helpText: Only applies outside classes when Use arrow function is disabled. Generates function(...) without a function name.
  - name: useArrow
    display: Use arrow function
    type: checkbox
    advanced: true
    settings:
      default: true
    helpText: When enabled, generates an arrow function. Inside classes, this renders a class property initialized with an arrow function. Outside classes, this renders const name = (...) => {}.
  - name: typeDefinition
    display: Type Definition
    type: text
    options: ''
    helpText: Typescript type definition for the expected returned value
children: []
*/
{% set parentElement = element.parent | elementData %}  
{% if parentElement.value == 'class' %}
  {% if element.values.functionName == 'constructor' %}
constructor({{ element.values.functionParameters }}) {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}  
}
  {% else %}
    {% if element.values.useArrow %}
public {% if element.values.static %}static {% endif %}{{ element.values.functionName }} = {% if element.values.async %}async {% endif %}({{ element.values.functionParameters }}){% if element.values.typeDefinition %}{{ element.values.typeDefinition|raw}}{% endif %} => {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}  
}
    {% else %}
public {% if element.values.static %}static {% endif %}{{ element.values.functionName }}({{ element.values.functionParameters }}){% if element.values.typeDefinition %}{{ element.values.typeDefinition|raw}}{% endif %} {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}  
}
    {% endif %}
  {% endif %}
{% else %}
  {% set functionContent %}
{% if element.values.useArrow %}
  {% if element.values.functionName %}const {{ element.values.functionName }} = {% endif %}{% if element.values.async %}async {% endif %}({{ element.values.functionParameters }}){% if element.values.typeDefinition %}{{ element.values.typeDefinition|raw}}{% endif %} => {
    {{ element.values.functionBody | raw }}
    {{ content | raw }}  
  }
{% else %}
  {% if element.values.anonymous %}
    {% if element.values.async %}async {% endif %}function({{ element.values.functionParameters }}){% if element.values.typeDefinition %}{{ element.values.typeDefinition|raw}}{% endif %} {
      {{ element.values.functionBody | raw }}
      {{ content | raw }}  
    }
  {% else %}
    {% if element.values.async %}async {% endif %}function {{ element.values.functionName }}({{ element.values.functionParameters }}){% if element.values.typeDefinition %}{{ element.values.typeDefinition|raw}}{% endif %} {
      {{ element.values.functionBody | raw }}
      {{ content | raw }}  
    }
  {% endif %}
{% endif %}
  {% endset %}
  {% if element.values.renderElsewhere and element.values.renderElsewhere != 'inPlace' %}
    {{ add_setting(element.values.renderElsewhere, functionContent) }}
  {% else %}
    {{ functionContent }}
  {% endif %}
{% endif %}