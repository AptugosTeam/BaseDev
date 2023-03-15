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
children: []
*/
{% set bpr %}
import AuthService from '../services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService.login({{ element.values.Email }}, {{ element.values.Password }}).then(
  (res) => {
    navigation.push('{{ (element.values.OnSuccess | elementData).path }}')
  },
  (error) => {
    setloginError(error.response.data.message)
  }
)