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
  - name: useCustomCode
    display: Use Custom Code
    type: checkbox
    options: ''
  - name: customCode
    display: Custom Code
    type: code
    settings:
      propertyCondition: useCustomCode
      condition: true
    options: ''
settings:
  - name: BackendPackages
    value: '"passport": "^0.7.0", "passport-jwt": "^4.0.1",'
  - name: BackendImports
    value: |-
      const passport = require('passport');
      const JwtStrategy = require('passport-jwt').Strategy;
      const { ExtractJwt } = require('passport-jwt');
  - name: ServerAddenum
    value: |-

      passport.use(new JwtStrategy({ secretOrKey: {{ element.values.secret | default("'thisisthesecretandshouldbeconfigurable'") }}, jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken() }, async (jwt_payload, done) => {
        done(null,jwt_payload)
      }))

      const authMiddleware = (req, res, next) => {
        if (req.method === 'OPTIONS') return res.status(200).end();
        {%  if element.values.useCustomCode%}
        {%  if element.values.customCode%}
        {{ element.values.customCode }}
        {% endif %}
        {{ content | raw }}
        {% else %}
          const allowedRoutes = {{ element.values.routes | default('[]') }}
          if (allowedRoutes.some(route => req.url.startsWith(route))) {
            next()
          } else {
            return passport.authenticate('jwt', { session: false })(req, res, next)
          }
        {% endif %}
      }

      app.use(authMiddleware)
*/
