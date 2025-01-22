/*
path: function.tpl
type: file
unique_id: r0mQRZ4N
icon: ico-function2
sourceType: javascript
order: 5
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
children: []
*/
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

