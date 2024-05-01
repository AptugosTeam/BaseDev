/*
path: passportjs.tpl
keyPath: elements/Interact/Passport/passportjs.tpl
unique_id: Q7AATMHF
completePath: elements/Interact/Passport/passportjs.tpl
type: file
icon: ico-social-sharing
children: []
options:
  - name: secret
    display: Session Secret
    type: text
    options: ''
  - name: cookieMaxAge
    display: Cookie Expiration Time (miliseconds)
    type: text
    options: ''
  - name: fullUser
    display: Retrieve full user?
    type: checkbox
    settings:
      default: truea
    advanced: true
  - name: fieldsToRetrieve
    display: Pick specific fields to retrieve
    type: text
    settings:
      default: []
      propertyCondition: fullUser
    advanced: true
  - name: validateUser
    display: Validate user?
    type: checkbox
    settings:
      default: false
    advanced: true
  - name: errorLanguage
    display: Errors Language
    type: dropdown
    options: 
      return [ [ 'en', 'English' ], [ 'es', 'Spanish' ] ]
    settings:
      default: 'en'
  - name: tokenSecret
    display: Token Secret
    type: text
    options: ''
settings:
  - name: BackendPackages
    value: '"cookie-parser": "^1.4.6", "express-session": "^1.18.0", "passport": "^0.7.0", "passport-local": "^1.0.0",'
  - name: ServerAddenum
    value: |-
      const cookieParser = require('cookie-parser')
      const session = require('express-session')
      const passport = require('passport')
      const LocalStrategy = require('passport-local')
      const userService = require('./app/services/users.service')

      app.use(cookieParser())
      app.use(session({
        secret: '{{ element.values.secret | default('thisShouldBeConfigurable') }}',
        saveUninitialized: false,
        resave: false,
        cookie: {
          maxAge: {{ element.values.cookieMaxAge | default(60000 * 60) }}
        }
      }))
      app.use(passport.initialize())
      app.use(passport.session())

      passport.use(new LocalStrategy({ usernameField: 'email' }, async (email, password, done) => {
        try {
          const user = await userService.verifyForPassport(email, password   
          {% if element.values.fullUser or element.values.fieldsToRetrieve or element.values.errorLanguage or element.values.rememberMe or element.values.validateUser %}, 
          {
          {% if not element.values.fullUser %} fullUser: {{ element.values.fullUser | default(true) }}, {% endif %}
          {% if element.values.fullUser != true and element.values.fieldsToRetrieve %} fieldsToRetrieve: {{ element.values.fieldsToRetrieve | default([]) }}, {% endif %} 
          {% if element.values.errorLanguage %} lang: '{{ element.values.errorLanguage | default('en') }}',{% endif %}  
          {% if element.values.validateUser %} validate: {{ element.values.validateUser | default(false) }},{% endif %} 
          }
          {% endif %} )
          if (!user) return done(null, false, { message: 'Invalid Credentials' })
          done(null, user)
        } catch (error) {
          console.log('passport error', error)
          done(null, false)
        }
      }))

      passport.serializeUser((user, done) => done(null, user._id))

      passport.deserializeUser(async (id, done) => {
        try {
          const user = await userService.getPassportUser(id, '{{ element.values.errorLanguage | default('en') }}')
          if (!user) return done('User not found', false, { message: 'Invalid Credentials'})
          done(null, user)
        } catch (error) {
          console.log('passport deserialize', error)
          done(error, null)
        }
      })
  - name: ServerRoute
    value: |
      // Authenticate User
      app.post('/api/users/authentication', passport.authenticate('local'), async (req, res) => {
        try {
          const token = await userService.getToken(req.user {% if element.values.tokenSecret %},{{ element.values.tokenSecret }}{% endif %})
          res.json({accessToken: token, data: req.user})
        } catch (error) {
          res.status(401).json(error)
        }
      })
      // Logout user and remove session
      app.post('/api/users/logout', (req, res) => {
        if (!req.user) return res.sendStatus(401)
        req.logout((error) => {
          if (error) return res.sendStatus(400)
          res.sendStatus(200)
        })
        res.sendStatus(200)
      })
extraFiles:
  - source: 'elements/Interact/Passport/999_passportMiddleware.js'
    destination: 'back-end/app/middlewares/passport.middleware.js'
*/
