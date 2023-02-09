/*
path: checkIfLoggedIn.tpl
type: file
unique_id: cili
icon: ico-field
sourceType: javascript
options:
  - name: loginScreen
    display: Redirect
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.pageUtils.getAllPages()]
  - name: fieldVariable
    display: Variable
    type: text
    settings:
      propertyCondition: Field
      condition: useVar
      active: true
children: []
*/
{% if element.values.loginScreen == 'useVar' %}
  {% set dest = element.values.fieldVariable %}
{% else %}
  {% set dest = (element.values.loginScreen | elementData).path %}
{% endif %}
{% set bpr %}
import authHeaders from '../services/auth-header'
{% endset %}
{{ save_delayed('bpr',bpr)}}
authHeaders().then(result => {
    if (!result) {
      navigation.navigate( {{ dest | textOrVariable }} )
    }
  })
