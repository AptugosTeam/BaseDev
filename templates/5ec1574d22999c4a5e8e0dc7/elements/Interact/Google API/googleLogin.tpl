/*
path: googleLogin.tpl
completePath: elements/Interact/Google API/googleLogin.tpl
type: file
unique_id: reIaridw
icon: f:googleLogin.svg
children: []
settings:
  - name: Packages
    value: '"@react-oauth/google": "0.7.1",'
  - name: BackendPackages
    value: '"google-auth-library": "8.7.0",'
  - name: ServerRoute
    value: |
      const { OAuth2Client } = require('google-auth-library')
      const oAuth2Client = new OAuth2Client(
        '{{ element.values.clientid }}',
        '{{ element.values.clientSecret }}',
        'postmessage',
      )
      app.post('/auth/google', async (req, res) => {
        const { tokens } = await oAuth2Client.getToken(req.body.code)
        res.json(tokens)
      })
  - name: SiteWideBeforePageRenderAddenum
    value: 'import { GoogleOAuthProvider } from "@react-oauth/google"'
  - name: SiteWideWrapStart
    value: '<GoogleOAuthProvider clientId="{{ element.values.clientid }}">'
  - name: SiteWideWrapEnd
    value: '</GoogleOAuthProvider>'
options:
  - name: clientid
    display: Google Client ID
    type: text
    options: ''
  - name: clientSecret
    display: Client Secret
    type: text
    options: ''
  - name: onFailure
    display: On Failure
    type: text
    options: ''
  - name: shape
    display: Shape
    type: dropdown
    options: 
      return [ [ 'default', 'Default' ], [ 'circle', 'Circle' ], [ 'rectangular', 'Rectangular' ], [ 'pill', 'Pill' ], [ 'square', 'Square' ] ]
    settings:
      default: 'default'
  - name: size
    display: Size
    type: dropdown
    options: 
      return [ [ 'default', 'Default' ], [ 'small', 'Small' ], [ 'medium', 'Medium' ], [ 'large', 'Large' ] ]
    settings:
      default: 'default'
  - name: icon
    display: Icon
    type: checkbox
    settings:
      default: false
  - name: language
    display: Language
    type: dropdown
    options: 
      return [ [ 'default', "Browser's Default Language" ], [ 'en_US', 'English' ], [ 'es_AR', 'Spanish' ] ]
    settings:
      default: 'default'
extraFiles:
  - source: 'elements/Interact/Google API/999_gmailservice.js'
    destination: 'front-end/services/gmail.service.js'
*/
{% set bpr %}
import AptugoGmail from '@services/gmail.service'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import { GoogleLogin } from '@react-oauth/google'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<GoogleLogin
  onSuccess={async (responseGoogle) => {
    const userInfo = AptugoGmail.getUserInfo(responseGoogle.credential)
    {{ content | raw }}
  }}
  {% if element.values.onFailure %}
    onError={ {{ element.values.onFailure | functionOrCall }} }
  {% endif %}
  {% if element.values.shape and element.values.shape != "default" %}
    shape='{{ element.values.shape }}'
  {% endif %}
  {% if element.values.size and element.values.size != "default" %}
    size='{{ element.values.size }}'
  {% endif %}
  {% if element.values.language and element.values.language != "default" %}
    locale='{{ element.values.language }}'
  {% endif %}
  {% if element.values.icon %}
    type="icon"
  {% endif %}
/>