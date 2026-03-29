/*
path: login.tpl
type: file
unique_id: yZDJR2J2
icon: ico-field
sourceType: javascript
options:
  - name: Email
    display: Email variable
    type: text
    required: true
  - name: Password
    display: Password variable
    type: text
    required: true
  - name: model
    display: Model (optional)
    type: text
    advanced: true
    settings:
      value: null
  - name: options
    display: Login Options
    type: text
    advanced: true
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
    type: code
  - name: await
    display: Await?
    type: checkbox
*/

{% set bpr %}
import AuthService from '@services/auth.service'
import store from '@store/store'
import { setUser } from '@store/slices/userSlice'
{% endset %}
{{ save_delayed('bpr',bpr)}}

{% set storeName = element.values.variableStoreName %}

{% if element.values.variableStore %}
{% if element.values.await %}
const {{ storeName }} = {% if element.values.await %}await{% endif %} AuthService.login(
  {{ element.values.Email }},
  {{ element.values.Password }},
  {% if element.values.model %}'{{ element.values.model }}',{% endif %}
  {% if element.values.options %}{ {{ element.values.options }} }{% endif %}
)
    if ({{ storeName }}) {
      store.dispatch(setUser({{ storeName }}?.data || {{ storeName }}))
      {{ content | raw }}
      navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
    }
{% else %}
AuthService.login(
  {{ element.values.Email }},
  {{ element.values.Password }},
  {% if element.values.model %}'{{ element.values.model }}',{% endif %}
  {% if element.values.options %}{ {{ element.values.options }} }{% endif %}
).then({{ storeName }} => {
    store.dispatch(setUser({{ storeName }}?.data || {{ storeName }}))
    {{ content | raw }}
    navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
}).catch(error => {
    {{ element.values.CustomError | raw }}
})
{% endif %}
{% else %}
{% if element.values.await %}await{% endif %} AuthService.login(
  {{ element.values.Email }},
  {{ element.values.Password }},
  {% if element.values.model %}'{{ element.values.model }}',{% endif %}
  {% if element.values.options %}{ {{ element.values.options }} }{% endif %}
).then(result => {
    store.dispatch(setUser(result?.data || result))
    {{ content | raw }}
    navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
}).catch(error => {
    {{ element.values.CustomError | raw }}
})
{% endif %}
