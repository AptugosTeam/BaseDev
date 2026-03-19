/*
path: logout.tpl
type: file
unique_id: yZDJR2J1
icon: ico-field
sourceType: javascript
options:
  - name: OnLogout
    display: Redirect To
    type: dropdown
    options: return aptugo.pageUtils.getAllPages()
    required: true
children: []
*/
{% set bpr %}
import AuthService from '@services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService.logout().then(
  (res) => {
    navigation.push('{{ (element.values.OnLogout | elementData).path }}')
  })
