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
  - name: code
    display: Code before redirect
    type: function
  - name: redirect
    display: Redirect On Success?
    type: checkbox
    settings:
      default: false
  - name: OnSuccess
    display: On Successful Register
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
    settings:
      propertyCondition: redirect
      condition: '"true"'
  - name: codeOnError
    display: On Error
    type: function
  - name: loginOptions
    display: Activate Login Options?
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: rememberMe
    display: Remember me variable
    type: text
    advanced: true
    settings:
      propertyCondition: loginOptions
      condition: true
  - name: fullUser
    display: Retrieve full user?
    type: checkbox
    settings:
      default: true
      propertyCondition: loginOptions
      condition: true
    advanced: true
  - name: fieldsToRetrieve
    display: Pick specific fields to retrieve
    type: text
    settings:
      default: []
      propertyCondition: fullUser
      condition: false
    advanced: true
  - name: validate
    display: Validate User?
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: validationEmail
    display: Validation Email Account
    type: text
    required: true
    advanced: true
    settings:
      propertyCondition: validate
      condition: true
  - name: validationSubject
    display: Validation Email Subject
    type: text
    required: true
    advanced: true
    settings:
      propertyCondition: validate
      condition: true
  - name: validationName
    display: Validation Email Name
    type: text
    required: true
    advanced: true
    settings:
      propertyCondition: validate
      condition: true
  - name: validationMessage
    display: Validation Email Message
    type: text
    required: true
    advanced: true
    settings:
      propertyCondition: validate
      condition: true
  - name: lang
    display: Errors Default Language
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

AuthService.register({{ element.values.Data }}{% if element.values.loginOptions or element.values.validate or element.values.lang %},
  {
    {% if element.values.lang %} lang: '{{ element.values.lang | default('en') }}', {% endif %}
    {% if not element.values.fullUser %} fullUser: {{ element.values.fullUser | default(true) }}, {% endif %}
    {% if element.values.fullUser != true and element.values.fieldsToRetrieve %} fieldsToRetrieve: {{ element.values.fieldsToRetrieve | default([]) }}, {% endif %}
    {% if element.values.rememberMe %} remember: {{ element.values.rememberMe | default(true) }},{% endif %} 
    {% if element.values.validate %} validate: {{ element.values.validate | default(false) }},
    validationEmail: {
      {% if element.values.validationEmail %} email: {{ element.values.validationEmail }},{% endif %}
      {% if element.values.validationSubject %} subject: {{ element.values.validationSubject | textOrVariable | default('') }},{% endif %}
      {% if element.values.validationName %} name: {{ element.values.validationName | textOrVariable | default('') }},{% endif %}
      {% if element.values.validationMessage %} message: {{ element.values.validationMessage }},{% endif %}
    }
    {% endif %} 
  }{% endif %} 
).then(_result => {
    {% if element.values.code %}
      {{ element.values.code }}
    {% endif %}
    {% if element.values.OnSuccess %}
    navigation.push('{{ (element.values.OnSuccess | elementData).path }}')
    {% endif %}
}).catch(error => {
    {% if element.values.codeOnError %}
      {{ element.values.codeOnError }}
    {% else %}
      setregisterError(error.response.data.message)
    {% endif %}
})
