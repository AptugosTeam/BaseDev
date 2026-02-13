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
  - name: redirectTimeout
    display: Waiting time before redirect
    advanced: true
    propertyCondition: OnSuccess
    condition: true
children: []
*/
{% set bpr %}
import { fetcher } from '@lib/fetch'
{% endset %}
{{ save_delayed('bpr',bpr) }}
fetcher('/api/auth', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    email: loginData.Email,
    password: loginData.Password,
  }),
}).then(res => {
  {% if element.children|length > 1 %}
    {{ element.children[0].rendered | raw }}
  {% else %}
    {{ content | raw }}
  {% endif %}
  {% if element.values.OnSuccess %}
    setTimeout(() => {
      router.push('{{ (element.values.OnSuccess | elementData).path }}')
    },{{ element.values.redirectTimeout|default( 3000 ) }})
  {% endif %}
}).catch(error => {
  {% if element.children|length > 1 %}
    {{ element.children[1].rendered | raw }}
  {% endif %}
})