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
  - name: finallyContent
    display: Finally content
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
{% if element.values.urlFULL %}
{% set bpr %}
import { resolveApiUrl } from '@services/api'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% endif %}

{% set storeName = element.values.variableStoreName %}
{% set storeType = element.values.variableStoreType | default('const') %}
{% set onError = element.values.onError | default('console.error(error)') %}
{% set finallyContent = element.values.finallyContent %}
{% if element.values.urlFULL %}
  {% set requestUrl %}resolveApiUrl({{ element.values.url | textOrVariableInCode }}){% endset %}
{% else %}
  {% set requestUrl %}{{ element.values.url | textOrVariableInCode }}{% endset %}
{% endif %}
{% set requestCall %}
axios.{{ element.values.method|default('get') }}(
  {{ requestUrl | raw }}{% if element.values.dataVariable %}, {{ element.values.dataVariable }}{% endif %},
  {% if element.values.extraOptions %}{{ element.values.extraOptions | raw }}{% endif %}
)
{% endset %}

{% if element.values.variableStore %}
  {% if element.values.await %}
    {% if finallyContent %}
      {% if storeType == 'existing let' %}
        {{ storeName }} = await (async () => {
          try {
            return await {{ requestCall | raw }}
          } catch (error) {
            {{ onError | raw }}
          } finally {
            {{ finallyContent | raw }}
          }
        })()
      {% else %}
        {{ storeType }} {{ storeName }} = await (async () => {
          try {
            return await {{ requestCall | raw }}
          } catch (error) {
            {{ onError | raw }}
          } finally {
            {{ finallyContent | raw }}
          }
        })()
      {% endif %}
    {% else %}
      {% if storeType == 'existing let' %}
        {{ storeName }} = await {{ requestCall | raw }}
      {% else %}
        {{ storeType }} {{ storeName }} = await {{ requestCall | raw }}
      {% endif %}
    {% endif %}
  {% else %}
    {% if storeType == 'existing let' %}
      {{ storeName }} = {{ requestCall | raw }}
      .catch(error => {
        {{ onError | raw }}
      })
      {% if finallyContent %}
      .finally(() => {
        {{ finallyContent | raw }}
      })
      {% endif %}
    {% else %}
      {{ storeType }} {{ storeName }} = {{ requestCall | raw }}
      .catch(error => {
        {{ onError | raw }}
      })
      {% if finallyContent %}
      .finally(() => {
        {{ finallyContent | raw }}
      })
      {% endif %}
    {% endif %}
  {% endif %}
{% else %}
  {% if element.values.await %}
    {% if content | trim %}
      try {
        const result = await {{ requestCall | raw }}
        {{ content | raw }}
      } catch (error) {
        {{ onError | raw }}
      }{% if finallyContent %}
      finally {
        {{ finallyContent | raw }}
      }{% endif %}
    {% else %}
      try {
        await {{ requestCall | raw }}
      } catch (error) {
        {{ onError | raw }}
      }{% if finallyContent %}
      finally {
        {{ finallyContent | raw }}
      }{% endif %}
    {% endif %}
  {% else %}
    {{ requestCall | raw }}
    .then(result => {
      {{ content | raw }}
    })
    .catch(error => {
      {{ onError | raw }}
    }){% if finallyContent %}
    .finally(() => {
      {{ finallyContent | raw }}
    }){% endif %}
  {% endif %}
{% endif %}
