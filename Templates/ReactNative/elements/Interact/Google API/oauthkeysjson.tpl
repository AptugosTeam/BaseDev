/*
path: oauthkeysjson.tpl
type: file
unique_id: dBslaVhF
icon: ico-field
helpText: Store the OAuth service account JSON used by Google API backend integrations
options:
  - name: json
    display: JSON Oauth2 content
    helpText: Paste the full OAuth or service-account JSON content to be written to oauth2.keys.json
    type: text
    options: ''
renderpath: back-end/app/services/oauth2.keys.json
children: []
internalUse: true
*/

{{ element.values.json | raw }}
