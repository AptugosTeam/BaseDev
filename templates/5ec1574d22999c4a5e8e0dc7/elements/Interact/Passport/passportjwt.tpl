/*
path: passportjwt.tpl
keyPath: elements/Interact/Passport/passportjwt.tpl
unique_id: Q7AATMHF
completePath: elements/Interact/Passport/passportjwt.tpl
type: file
icon: ico-social-sharing
children: []
options:
  - name: secret
    display: Session Secret
    type: text
    options: ''
settings:
  - name: BackendPackages
    value: '"passport": "^0.7.0", "passport-jwt": "^4.0.1",'
  - name: ServerAddenum
    value: |-
      const passport = require('passport')
      const JwtStrategy = require('passport-jwt').Strategy;
      const userService = require('./app/services/users.service')

      const getJwtFromReq = (req) => {
        try {
          console.log('headers', req.headers)
          return req.headers.authorization
        } catch (error) {
          return null
        }
      }

      passport.use(new JwtStrategy({ secretOrKey: '{{ element.values.secret | default('thisShouldBeConfigurable') }}', jwtFromRequest: getJwtFromReq }, async (jwt_payload, done) => {
        console.log("**",jwt_payload)
        done(null,jwt_payload)
      }))
*/
