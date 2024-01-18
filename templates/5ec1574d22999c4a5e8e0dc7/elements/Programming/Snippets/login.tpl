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
  - name: OnSuccess
    display: On Successful login
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
    required: true
  - name: alternativeCall
    display: Alternative Call to AuthService
    type: text
    advanced: true
  - name: fullUser
    display: Retrieve full user?
    type: checkbox
    settings:
      default: true
    advanced: true
  - name: fieldsToRetrieve
    display: Pick specific fields to retrieve
    type: text
    settings:
      default: []
      propertyCondition: fullUser
    advanced: true
children: []
*/
{% set bpr %}
import AuthService from '@services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService[{{ element.values.alternativeCall | default("'login'") }}]({{ element.values.Email }}, {{ element.values.Password }}, {{ element.values.fullUser | default(true) }}, {% if element.values.fullUser != true %} {{ element.values.fieldsToRetrieve | default([]) }} {% endif %}).then(
  (res) => {
    navigation.push('{{ (element.values.OnSuccess | elementData).path }}')
  },
  (error) => {
    setloginError(error.response.data.message)
  }
)