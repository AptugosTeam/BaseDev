/*
path: facebookLogin.tpl
completePath: elements/Interact/Google API/facebookLogin.tpl
type: file
unique_id: reGorodw
icon: f:facebookLogin.svg
children: []
settings:
  - name: Packages
    value: '"react-facebook-login": "^4.1.1",'
options:
  - name: clientid
    display: Facebook APP ID
    type: text
    options: ''
*/
{% set bpr %}
import { FacebookOutlined } from '@mui/icons-material'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import FacebookLogin from 'react-facebook-login'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<FacebookLogin
  appId={{ element.values.clientid | textOrVariable }}
  autoLoad={false}
  fields="name,email"
  textButton=""
  cssClass={theme.loginFacebook}
  scope="public_profile,email"
  icon={<FacebookOutlined fontSize="large" />}
  callback={responseFacebook}
/>