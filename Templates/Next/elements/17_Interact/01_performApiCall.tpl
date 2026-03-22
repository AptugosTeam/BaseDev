/*
path: performApiCall.tpl
type: file
unique_id: KWeP9css
icon: ico-api-call
double: true
color: rgb(0,230,230)
backColor: rgba(6, 201, 210, 0.25)
order: 1
name: Perform API Call
helpText: >
  Performs an HTTP request using fetcher.

  If the element has children, the response is available inside the block using the Result Variable Name.

  If there are no children, the result is assigned using:
  const resultVar = await fetcher(...)

  RESULT:
    response.data <- The content
    response.status <- The HTTP status

  RULES:
  - The result variable is only available inside the block (when using children)
  - Always use the exact Result Variable Name
  - Provide Data Variable for POST/PUT requests
  - Enable Serialize Data if the API expects formatted payload

  Errors are handled in Catch Error (default: console.error(error)).

  This element executes an API call and exposes the result inside the success block.

  BASIC USAGE:
  - URL: endpoint to call
  - Method: GET, POST, PUT, DELETE
  - Data Variable: (optional) variable to send as request body
  - Result Variable Name: name of the response inside the success block
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
  - name: serializeData
    display: Should I Serialize the data?
    type: checkbox
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
sourceType: javascript
children: []
*/
{% set bpr %}
import { fetcher } from '@lib/fetch'
{% if element.values.serializeData %}import serializeData from '@lib/serializeData'{% endif %}
{% endset %}
{{ save_delayed('bpr',bpr) }}

{% set url = element.values.url %}
{% if element.values.urlFULL %}
  {% set url = settings.apiURL ~ element.values.url %}
{% endif %}

{% set fetchCall %}
fetcher({{ url | textOrVariableInCode }}, { 
  method: '{{ element.values.method|default('GET') }}'
  {% if element.values.dataVariable %}, body: {% if element.values.serializeData %}serializeData({% endif %}{{ element.values.dataVariable }}{% if element.values.serializeData %}){% endif %}{% endif %}
  {% if element.values.extraOptions %}, {{ element.values.extraOptions | raw }}{% endif %}
})
{% endset %}
{% if element.children %}
  {{ fetchCall }}.then({{ element.values.resultVar|default('result') }} => {
    {{ content | raw }}
  }).catch((error) => {
    {% if element.values.onError %}
      {{ element.values.onError }} 
    {% else %}
      console.error(error)
    {% endif %}
  })
{% else %}
  const {{ element.values.resultVar|default('result') }} = await {{ fetchCall }}
{% endif %}