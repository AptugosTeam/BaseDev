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
{% set returning %}
{% if element.values.loginScreenNot != 'none' and element.values.loginScreenNot is defined %}
  if (!data.user) {
    return {
      redirect: {
        destination: '{{ destNot }}',
        permanent: false,
      },
    }
  }
{% endif %}
{% if element.values.loginScreen != 'none' and element.values.loginScreen is defined %}
  if (data.user) {
    return {
      redirect: {
        destination: '{{ dest }}',
        permanent: false,
      },
    }
  }
{% endif %}
{% endset %}
{{ add_setting('UserAuthServer', returning)}}
