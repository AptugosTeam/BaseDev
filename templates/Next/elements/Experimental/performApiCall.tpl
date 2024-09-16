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
  - name: resultVar
    display: Result Variable Name
    type: text
    advanced: true
  - name: onError
    display: Catch Error
    type: function
    options: ''
    advanced: true
    settings:
      default: console.error(error)
  - name: await
    display: Await?
    type: checkbox
    options: ''
    settings:
      value: 'false'
sourceType: javascript
children: []
*/
{% set bpr %}
import { fetcher } from '@lib/fetch'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set url = element.values.url %}
{% if element.values.urlFULL %}
{% set url = settings.apiURL ~ element.values.url %}
{% endif %}
{% if element.values.await %}await{% endif %} fetcher({{ url | textOrVariableInCode }}, { method: '{{ element.values.method|default('GET') }}' {% if element.values.dataVariable %}, {{ element.values.dataVariable }}{% endif %} , {% if element.values.extraOptions %}{{ element.values.extraOptions | raw }}{% endif %} }).then({{ element.values.resultVar|default('result') }} => {
 {{ content | raw }}
}).catch((error) => {
  {% if element.values.onError %}
    {{ element.values.onError }} 
  {% else %}
    console.error(error)
  {% endif %}
})
