/*
path: passportgoogle.tpl
keyPath: elements/Interact/Passport/passportgoogle.tpl
unique_id: Q7GOOGLE
completePath: elements/Interact/Passport/passportgoogle.tpl
type: file
icon: ico-social-sharing
children: []
options:
  - name: clientID
    display: Client ID
    type: text
    options: ''
  - name: clientSecret
    display: Client Secret
    type: text
    options: ''
  - name: callbackURL
    display: Callback URL
    type: text
    options: ''
  - name: customCode
    display: Custom Code
    type: code
    options: ''
  - name: importPassport
    display: Import passportjs?
    type: checkbox
    options: ''
settings:
  - name: BackendPackages
    value: '{%  if element.values.importPassport%}"passport": "^0.7.0", {% endif %}"passport-google-oauth20": "^2.0.0",'
  - name: BackendImports
    value: |-
      {%  if element.values.importPassport%}const passport = require('passport');{% endif %}
      const GoogleStrategy = require('passport-google-oauth20').Strategy;
  - name: ServerAddenum
    value: |-
      passport.use(new GoogleStrategy({ 
        clientID: {{ element.values.clientID | default('process.env.GOOGLE_CLIENT_ID')}}, 
        clientSecret: {{ element.values.clientSecret | default('process.env.GOOGLE_CLIENT_SECRET')}},
        callbackURL: {{ element.values.callbackURL | default("'/auth/google/callback'")}}
      }, async (accessToken, refreshToken, profile, done) => {
        {{ element.values.customCode }}
      }))
*/
