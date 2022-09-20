/*
path: googleLogin.tpl
completePath: elements/Interact/Google API/googleLogin.tpl
type: file
unique_id: reIaridw
icon: f:googleLogin.svg
children: []
options:
  - name: clientid
    display: Google Client ID
    type: text
    options: ''
*/
{% set bpr %}
import { Google } from '@mui/icons-material'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import GoogleLogin from 'react-google-login'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<GoogleLogin
  clientId={{ element.values.clientid | textOrVariable }}
  buttonText=""
  onSuccess={responseGoogle}
  onFailure={responseGoogle}
  cookiePolicy={'single_host_origin'}
  className={theme.loginGoogle}
  style={ { boxShadow: 'none' }}
  render={renderProps => (
    <button className={theme.loginGoogle} onClick={renderProps.onClick} disabled={renderProps.disabled}><Google fontSize="large" /></button>
  )}
/>