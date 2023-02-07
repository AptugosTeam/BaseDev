/*
path: logout.tpl
type: file
unique_id: yZDJR2J1
icon: ico-field
sourceType: javascript
children: []
*/
{% set bpr %}
import AuthService from '../services/auth.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
AuthService.logout()