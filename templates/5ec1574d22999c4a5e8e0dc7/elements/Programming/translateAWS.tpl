/*
path: translateAWS.tpl
type: file
unique_id: hX9b1lvZ
icon: f:translate.svg
sourceType: javascript
options:
  - name: idAccess
    display: Access Key Id
    type: text
    options: ''
  - name: idAccessSecret
    display: Secret Access Key
    type: text
    options: ''
  - name: region
    display: Region
    type: text
    options: ''
helpText: Translate amazon web service
settings:
  - name: Packages
    value: '"@aws-sdk/client-s3": "^3.592.0",'
  - name: Packages
    value: '"@aws-sdk/lib-storage": "^3.592.0",'
  - name: ServerRoute
    value: |
      const AWS = require('aws-sdk')
      AWS.config.update({
        accessKeyId: '{{ element.values.idAccess }}',
        secretAccessKey: '{{ element.values.idAccessSecret }}',
        region: '{{ element.values.region }}'
      });
      const translate = new AWS.Translate()
children: []
*/
// Translate amazon web service