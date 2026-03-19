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
  - name: await
    display: Await?
    type: checkbox
    options: ''
    settings:
      value: 'false'
  - name: variableStore
    display: store in variable?
    type: checkbox
    options: ''
    advanced: true
    settings:
      value: 'false'
  - name: variableStoreType
    display: Variable Type
    type: dropdown
    options: const;let;existing let
    advanced: true
    settings:
      propertyCondition: variableStore
      condition: true
  - name: variableStoreName
    display: Variable name
    type: text
    options: ''
    advanced: true
    settings:
      propertyCondition: variableStore
      condition: true
  - name: onError
    display: Catch Error
    type: function
    options: ''
    advanced: true
    settings:
      default: console.error(error)
  - name: finally
    display: finally
    type: function
    options: ''
    advanced: true
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

{% set storeName = element.values.variableStoreName %}
{% set storeType = element.values.variableStoreType | default('const') %}
{% set onError = element.values.onError | default('console.error(error)') %}

{% if element.values.variableStore %}
  {% if storeType == 'existing let' %}
    {{ storeName }} = {% if element.values.await %}await{% endif %} axios.{{ element.values.method|default('get') }}(
      {{ url | textOrVariableInCode }}{% if element.values.dataVariable %}, {{ element.values.dataVariable }}{% endif %},
      {% if element.values.extraOptions %}{{ element.values.extraOptions | raw }}{% endif %}
    )
  {% else %}
    {{ storeType }} {{ storeName }} = {% if element.values.await %}await{% endif %} axios.{{ element.values.method|default('get') }}(
      {{ url | textOrVariableInCode }}{% if element.values.dataVariable %}, {{ element.values.dataVariable }}{% endif %},
      {% if element.values.extraOptions %}{{ element.values.extraOptions | raw }}{% endif %}
    )
  {% endif %}
{% else %}
  axios.{{ element.values.method|default('get') }}(
    {{ url | textOrVariableInCode }}{% if element.values.dataVariable %}, {{ element.values.dataVariable }}{% endif %},
    {% if element.values.extraOptions %}{{ element.values.extraOptions | raw }}{% endif %}
  )
  .then(result => {
    {{ content | raw }}
  })
  .catch(error => {
    {{ onError | raw }}
  })
{% if element.values.finally %}
  .finally(()=> {
    {{ element.values.finally | raw }}
  })
{% endif %}

{% endif %}
