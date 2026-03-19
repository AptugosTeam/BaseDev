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
  - name: routes
    display: Allowed Routes (array)
    type: text
    options: ''
settings:
  - name: BackendPackages
    value: '"passport": "^0.7.0", "passport-jwt": "^4.0.1",'
  - name: ServerAddenum
    value: |-
      const passport = require('passport')
      const JwtStrategy = require('passport-jwt').Strategy;

      const getJwtFromReq = (req) => {
        try {
          return req.headers.authorization
        } catch (error) {
          return null
        }
      }

      passport.use(new JwtStrategy({ secretOrKey: {{ element.values.secret | default("'thisisthesecretandshouldbeconfigurable'") }}, jwtFromRequest: getJwtFromReq }, async (jwt_payload, done) => {
        done(null,jwt_payload)
      }))

      const authMiddleware = (req, res, next) => {
        if (req.method === 'OPTIONS') return res.status(200).end();
        const allowedRoutes = {{ element.values.routes | default('[]') }}
        if (allowedRoutes.some(route => req.url.startsWith(route))) {
          next()
        } else {
          return passport.authenticate('jwt', { session: false })(req, res, next)
        }
      }

      app.use(authMiddleware)
*/
