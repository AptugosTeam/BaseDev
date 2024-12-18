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
  - name: rememberMe
    display: Remember me variable
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
  - name: validateUser
    display: Validate user?
    type: checkbox
    settings:
      default: false
    advanced: true
  - name: codeOnError
    display: On Error
    type: function
    advanced: true
  - name: errorLanguage
    display: On Error
    type: dropdown
    options: >-
      return [['en', 'English'], ['es', 'Spanish']]
    settings:
      default: 'en'
    advanced: true
children: []
*/
{% set bpr %}
import AuthService from '@services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService.login({{ element.values.Email }}, {{ element.values.Password }}
  {% if element.values.fullUser or element.values.fieldsToRetrieve or element.values.errorLanguage or element.values.rememberMe or element.values.validateUser %}, 
  {
  {% if not element.values.fullUser %} fullUser: {{ element.values.fullUser | default(true) }}, {% endif %}
  {% if element.values.fullUser != true and element.values.fieldsToRetrieve %} fieldsToRetrieve: {{ element.values.fieldsToRetrieve | default([]) }}, {% endif %} 
  {% if element.values.errorLanguage %} lang: '{{ element.values.errorLanguage | default('en') }}',{% endif %} 
  {% if element.values.rememberMe %} remember: {{ element.values.rememberMe | default(true) }},{% endif %} 
  {% if element.values.validateUser %} validate: {{ element.values.validateUser | default(false) }},{% endif %} 
  }
  {% endif %} 
).then(
  (res) => {
    navigation.push('{{ (element.values.OnSuccess | elementData).path }}')
  },
  (error) => {
    {% if element.values.codeOnError %}
      {{ element.values.codeOnError }}
    {% else %}
      setloginError(error.response.data.message)
    {% endif %}
    
  }
)