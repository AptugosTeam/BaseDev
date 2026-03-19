/*
path: passportapple.tpl
keyPath: elements/Interact/Passport/passportapple.tpl
unique_id: Q7AAPPLE
completePath: elements/Interact/Passport/passportapple.tpl
type: file
icon: ico-social-sharing
children: []
options:
  - name: clientID
    display: Client ID
    type: text
    options: ''
  - name: teamID
    display: Team ID
    type: text
    options: ''
  - name: keyID
    display: Key ID
    type: text
    options: ''
  - name: privateKeyLocation
    display: Private Key Location
    type: text
    options: ''
  - name: callbackURL
    display: Callback URL
    type: text
    options: ''
  - name: scope
    display: Scope
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
    value: '{%  if element.values.importPassport%}"passport": "^0.7.0", {% endif %}"passport-apple": "^2.0.2",'
  - name: BackendImports
    value: |-
      {%  if element.values.importPassport%}const passport = require('passport');{% endif %}
      const AppleStrategy = require('passport-apple');
  - name: ServerAddenum
    value: |-
      passport.use(new AppleStrategy({
        clientID: {{ element.values.clientID | default('process.env.APPLE_CLIENT_ID') }},
        teamID: {{ element.values.teamID | default('process.env.APPLE_TEAM_ID') }},
        keyID: {{ element.values.keyID | default('process.env.APPLE_KEY_ID') }},
        privateKeyLocation: {{ element.values.privateKeyLocation | default('process.env.APPLE_PRIVATE_KEY_PATH') }},
        callbackURL: {{ element.values.callbackURL | default("'/auth/apple/callback'") }},
        scope: {{ element.values.scope | default("['name', 'email']") }}
      }, async (accessToken, refreshToken, idToken, profile, done) => {
          {{ element.values.customCode }}
      }))
*/
