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
children: []
*/
{% set bpr %}
import AuthService from '../services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService.register({{ element.values.Data }}).then(_result => {
    navigation.push('{{ (element.values.OnSuccess | elementData).path }}')
}).catch(error => {
    setregisterError(error.response.data.message)
})
