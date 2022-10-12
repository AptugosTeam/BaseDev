/*
path: gMailListMessages.tpl
type: file
unique_id: qgwpdQL5
icon: f:gMailListMessages.svg
options:
  - name: filter
    display: Filter
    type: text
    options: ''
  - name: clientId
    display: clientId
    type: text
  - name: apiKey
    display: API key
    type: text
  - name: pageVariable
    display: Variable for pagination
    type: text
settings:
  - name: Packages
    value: '"@react-oauth/google": "^0.2.8",'
  - name: SiteWideBeforePageRenderAddenum
    value: 'import { GoogleOAuthProvider } from "@react-oauth/google"'
  - name: SiteWideWrapStart
    value: '<GoogleOAuthProvider clientId="{{ element.values.clientId }}">'
  - name: SiteWideWrapEnd
    value: '</GoogleOAuthProvider>'
extraFiles:
  - source: 'elements/Interact/Google API/999_gmailservice.js'
    destination: 'front-end/services/gmail.service.js'
*/
{% set bpr %}
import AptugoGmail from '../services/gmail.service'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.filter %}if (!filter) filter = {{ element.values.filter | textOrVariable }}{% endif %}
AptugoGmail.listMessages(typeof filter !== 'undefined' ? filter : null{% if element.values.pageVariable %}, {{ element.values.pageVariable }}{% endif %}).then( (result) => {
  const promises = result.messages.map((item, index) => {
    return AptugoGmail.getMessage(item.id).then(res => { 
      return { ...item, ...res }
    })
  })
  Promise.all(promises).then(res => {
    {{ content | raw }}
  })
})
