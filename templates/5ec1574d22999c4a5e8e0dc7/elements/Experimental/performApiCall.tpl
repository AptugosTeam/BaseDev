/*
path: performApiCall.tpl
type: file
unique_id: KWeP9css
icon: ico-api-call
helpText: Performs a call to an api and returns the response
options:
  - name: url
    display: URL
    type: url
    options: ''
    settings:
      aptugoOnLoad: |-
        const element = arguments[0];
        let finalVarsToAdd = { result: { data: '' }}
        console.log(finalVarsToAdd, aptugo.variables)
        aptugo.variables.setElementVariable(element.unique_id, finalVarsToAdd);
      active: true
  - name: method
    display: Method
    type: dropdown
    options: 'get;post;put;delete'
  - name: dataVariable
    display: Data Variable
    helpText: This variable will be sent with the request
    type: text
    options: ''
  - name: extraOptions
    display: Extra options
    type: text
sourceType: javascript
children: []
*/
{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set url = element.values.url %}
{% if element.values.urlFULL %}
{% set url = settings.apiURL ~ element.values.url %}
{% endif %}
axios.{{ element.values.method|default('get') }}({{ url | textOrVariableInCode }}{% if element.values.dataVariable %}, {{ element.values.dataVariable }}{% endif %}, {% if element.values.extraOptions %}{{ element.values.extraOptions | raw }}{% endif %}).then(result => {
 {{ content | raw }}
}).catch((error) => {
  {% if element.values.onError %}
    {{ element.values.onError }} 
  {% else %}
    console.error(error)
  {% endif %}
})
