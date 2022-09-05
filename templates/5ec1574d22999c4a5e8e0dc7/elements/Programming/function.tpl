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
children: []
*/

{% if element.values.priority %}
{% set ph %}
const {{ element.values.functionName }} = ({{ element.values.functionParameters }}) => {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}  
}
{% endset %}
{{ save_delayed('ph',ph,1) }}
{% else %}
const {{ element.values.functionName }} = ({{ element.values.functionParameters }}) => {
  {{ element.values.functionBody | raw }}
  {{ content | raw }}  
}
{% endif %}

