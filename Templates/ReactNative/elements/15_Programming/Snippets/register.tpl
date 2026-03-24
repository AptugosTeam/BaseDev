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
  - name: disableRedirect
    display: Disable Redirect
    type: checkbox
    options: ''
    settings:
      value: false
  - name: OnSuccess
    display: On Successful login
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
    required: true
    settings:
      propertyCondition: disableRedirect
      conditionNegate: true
      condition: true
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
import AuthService from '@services/auth.service'
import store from '@store/store'
import { setUser } from '@store/slices/userSlice'
{% endset %}
{{ save_delayed('bpr',bpr)}}

{% set storeName = element.values.variableStoreName %}

{% if element.values.variableStore %}
{% if element.values.await %}
const {{ storeName }} = {% if element.values.await %}await{% endif %} AuthService.register({{ element.values.Data }})
    if ({{ storeName }}) {
      store.dispatch(setUser({{ storeName }}?.data || {{ storeName }}))
      {{ content | raw }}
      {% if not element.values.disableRedirect %}
      navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
      {% endif %}
    }
{% else %}
AuthService.register({{ element.values.Data }}).then({{ storeName }} => {
    store.dispatch(setUser({{ storeName }}?.data || {{ storeName }}))
    {{ content | raw }}
    {% if not element.values.disableRedirect %}
    navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
    {% endif %}
}).catch(error => {
    {{ element.values.CustomError | raw }}
})
{% endif %}
{% else %}
{% if element.values.await %}await{% endif %} AuthService.register({{ element.values.Data }}).then(result => {
    store.dispatch(setUser(result?.data || result))
    {{ content | raw }}
    {% if not element.values.disableRedirect %}
    navigation.replace('{{ (element.values.OnSuccess | elementData).path }}')
    {% endif %}
}).catch(error => {
    {{ element.values.CustomError | raw }}
})
{% endif %}
