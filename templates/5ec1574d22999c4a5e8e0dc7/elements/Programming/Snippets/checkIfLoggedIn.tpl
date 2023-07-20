/*
path: checkIfLoggedIn.tpl
type: file
unique_id: cili
icon: ico-field
sourceType: javascript
options:
  - name: loginScreenNot
    display: Redirect (If NOT)
    type: dropdown
    options: return [['none','No Redirect'],['useVar','Use a Variable'], ...aptugo.pageUtils.getAllPages()]
    settings:
      default: 'none'
  - name: fieldVariableNot
    display: Variable
    type: text
    settings:
      propertyCondition: loginScreenNot
      condition: useVar
      active: true
  - name: loginScreen
    display: Redirect (If YES)
    type: dropdown
    options: return [['none','No Redirect'],['useVar','Use a Variable'], ...aptugo.pageUtils.getAllPages()]
    settings:
      default: 'none'
  - name: fieldVariable
    display: Variable
    type: text
    settings:
      propertyCondition: loginScreen
      condition: useVar
      active: true
children: []
*/
{% if element.values.loginScreenNot != 'none' and element.values.loginScreenNot is defined %}
  {% if element.values.loginScreenNot == 'useVar' %}
    {% set destNot = element.values.fieldVariableNot %}
  {% else %}
    {% set destNot = (element.values.loginScreenNot | elementData).path %}
  {% endif %}
{% endif %}
{% if element.values.loginScreen != 'none' and element.values.loginScreen is defined %}
  {% if element.values.loginScreen == 'useVar' %}
    {% set dest = element.values.fieldVariable %}
  {% else %}
    {% set dest = (element.values.loginScreen | elementData).path %}
  {% endif %}
{% endif %}
{% set bpr %}
import authHeaders from '@services/auth-header'
{% endset %}
{{ save_delayed('bpr',bpr)}}
authHeaders().then(result => {
    {% if element.values.loginScreenNot != 'none' and element.values.loginScreenNot is defined %}
      if (!result) {
        navigation.push( {{ destNot | textOrVariable }} )
      }
    {% endif %}
    {% if element.values.loginScreen != 'none' and element.values.loginScreen is defined %}
      if (result) {
        navigation.push( {{ dest | textOrVariable }} )
      }
    {% endif %}
  })
