/*
path: register.tpl
type: file
unique_id: yZDJR2J4
icon: ico-field
sourceType: javascript
options:
  - name: Data
    display: Data variable
    type: text
    required: true
  - name: OnSuccess
    display: On Successful login
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
    required: true
  - name: variableStore
    display: store in variable?
    type: checkbox
    options: ''
    advanced: true
    settings:
      value: 'false'
  - name: variableStoreName
    display: Variable name
    type: text
    advanced: true
    settings:
      propertyCondition: variableStore
      condition: true
  - name: CustomError
    display: Custom error message
    type: text
  - name: await
    display: Await?
    type: checkbox
children: []
*/
{% set bpr %}
import AuthService from '../services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}

{% set storeName = element.values.variableStoreName %}

{% if element.values.variableStore %}
const {{ storeName }} = {% if element.values.await %}await{% endif %} AuthService.register({{ element.values.Data }})
    if (response) {
      navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
    }
{% else %}
{% if element.values.await %}await{% endif %} AuthService.register({{ element.values.Data }}).then(result => {
    navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
}).catch(error => {
    {{ element.values.CustomError | raw }}
})
{% endif %}