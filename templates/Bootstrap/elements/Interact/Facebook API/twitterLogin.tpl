/*
path: twitterLogin.tpl
completePath: elements/Interact/twitter API/twitterLogin.tpl
type: file
unique_id: ffffridw
icon: f:twitterLogin.svg
children: []
settings:
  - name: Packages
    value: '"react-twitter-login": "^4.1.1",'
options:
  - name: appid
    display: twitter APP ID
    type: text
    options: ''
  - name: functionName
    display: Function name to call on finish
    type: text
    settings:
      default: 'responsetwitter'
      active: true
  - name: buttonText
    display: Text displayed on button
    type: text
    settings:
      default: 'Login with twitter'
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
import { twitter } from '@mui/icons-material'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import twitterLogin from 'react-twitter-login/dist/twitter-login-render-props'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<twitterLogin
  appId={{ element.values.appid | textOrVariable }}
  callback={ {{ element.values.functionName | default("'responsetwitter'")}} }
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