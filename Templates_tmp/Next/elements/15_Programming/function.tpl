/*
path: function.tpl
type: file
unique_id: r0mQRZ4N
icon: ico-function2
sourceType: javascript
holder: true
order: 5
helpText: Prepares a function to be called by other components and actions
options:
  - name: functionName
    display: Function Name
    type: text
    options: ''
    settings:
      aptugoOnLoad: >-
        const element = arguments[0];
        const containerElement = element.values.objectProperty ? aptugo.pageUtils.findContainerElement(element.unique_id,'class').unique_id : aptugo.pageUtils.findContainerElement(element.unique_id).unique_id;
        if (element.values.functionName) {
          if (containerElement) {
            aptugo.variables.setVariable({ name: element.values.functionName, container: containerElement, unique_id: element.unique_id,value: element.values.functionName })
          }
        }
  - name: functionParameters
    display: Parameters
    type: text
    options: ''
  - name: functionBody
    display: Body
    type: function
    options: ''
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
  - name: async
    display: Async
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: static
    display: Static
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: anonymous
    display: Anonymous function
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
    {% if element.values.functionName %}const {{ element.values.functionName }} = {% endif %}{% if element.values.async%}async{% endif %} ({{ element.values.functionParameters }}) => {
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

