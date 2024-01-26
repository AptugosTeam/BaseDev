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
    display: On Successful Register
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
    required: true
  - name: alternativeCall
    display: Alternative Call to AuthService
    type: checkbox
    settings:
      default: false
    advanced: true
  - name: saveUserBrowser
    display: Where the User is Saved in the Browser?
    type: dropdown
    options: localStorage;sessionStorage
    settings:
      default: 'localStorage'
      propertyCondition: alternativeCall
      condition: '"true"'
      active: true
    advanced: true
children: []
*/
{% set bpr %}
import AuthService from '@services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.alternativeCall and element.values.saveUserBrowser != 'localStorage' %}
AuthService.registerWithSession({{ element.values.Data }}).then(_result => {
    navigation.push('{{ (element.values.OnSuccess | elementData).path }}')
}).catch(error => {
    setregisterError(error.response.data.message)
})
{% else %}
AuthService.register({{ element.values.Data }}).then(_result => {
    navigation.push('{{ (element.values.OnSuccess | elementData).path }}')
}).catch(error => {
    setregisterError(error.response.data.message)
})
{% endif %}
