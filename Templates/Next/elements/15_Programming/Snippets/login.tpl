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
  console.log('logged in', res)
}).catch(error => {
  setloginError(error)
})