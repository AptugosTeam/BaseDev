/*
path: oauthkeysjson.tpl
type: file
unique_id: dBslaVhF
icon: ico-field
options:
  - name: json
    display: JSON Oauth2 content
    type: text
    options: ''
renderpath: back-end/app/services/oauth2.keys.json
children: []
internalUse: true
*/

{{ element.values.json | raw }}