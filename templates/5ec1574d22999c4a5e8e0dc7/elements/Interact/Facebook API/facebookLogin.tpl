/*
path: facebookLogin.tpl
completePath: elements/Interact/Facebook API/facebookLogin.tpl
type: file
unique_id: ffffridw
icon: f:facebookLogin.svg
children: []
settings:
  - name: Packages
    value: '"react-facebook-login": "^4.1.1",'
options:
  - name: appid
    display: Facebook APP ID
    type: text
    options: ''
  - name: functionName
    display: Function name to call on finish
    type: text
    settings:
      default: 'responseFacebook'
      active: true
*/
{% set bpr %}
import { Facebook } from '@mui/icons-material'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import FacebookLogin from 'react-facebook-login/dist/facebook-login-render-props'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<FacebookLogin
  appId={{ element.values.appid | textOrVariable }}
  callback={ {{ element.values.functionName|default('responseFacebook')}} }
  fields="name,email,picture"
  render={renderProps => (
    {{ content | raw }}
  )}
/>