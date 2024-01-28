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
import { fetcher } from '@lib/fetch'
{% endset %}
{{ save_delayed('bpr',bpr) }}
fetcher('/api/auth', {
  method: 'DELETE'
}).then(res => {
  console.log('logged out', res)
})
