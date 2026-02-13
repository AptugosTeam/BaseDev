/*
path: FingerPrint.tpl
type: file
unique_id: NdHfgi2F
icon: ico-field
helpText: >-
  Allows fingerprinting on the server side (req.fingerprint to hold the
  information)
children: []
settings:
  - name: ServerAddenum
    value: |-
      var Fingerprint = require('express-fingerprint')
      app.use(Fingerprint({
        parameters:[
          // Defaults
          Fingerprint.useragent,
          Fingerprint.acceptHeaders,
          Fingerprint.geoip,
        ]
      }))
  - name: Packages
    value: '"express-fingerprint": "latest",'
*/
// Fingerprint added (use req.fingerprint to retrieve info)