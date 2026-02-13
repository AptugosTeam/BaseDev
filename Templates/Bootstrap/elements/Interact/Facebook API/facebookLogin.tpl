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
  - name: buttonText
    display: Text displayed on button
    type: text
    settings:
      default: 'Login with Facebook'
      active: true
  - name: autoLoad
    display: autoLoad Login with FB
    type: checkbox
    options: ''
  - name: manualRender
    display: Create custom render for FBLogin
    type: checkbox
    advanced: true
    settings:
      default: false
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
  callback={ {{ element.values.functionName | default("'responseFacebook'")}} }
  fields="name,email,picture"
  scope="email, public_profile,user_friends,user_actions.books"
  {% if element.values.autoLoad %}
    autoLoad={{ element.values.autoLoad }}
  {% endif %}
  render={ (renderProps) => (
    {% if element.values.manualRender %}
      {{ content | raw }}
    {% else %}
    <button onClick={renderProps.onClick}>{{ element.values.buttonText }}</button>
    {% endif %}
  )}
/>