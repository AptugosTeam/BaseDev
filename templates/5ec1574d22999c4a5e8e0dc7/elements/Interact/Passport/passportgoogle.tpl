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
settings:
  - name: BackendPackages
    value: '"passport": "^0.7.0", "passport-google-oauth20": "^2.0.0",'
  - name: ServerAddenum
    value: |-
      const passport = require('passport')
      const GoogleStrategy = require('passport-google-oauth20').Strategy;

      passport.use(new GoogleStrategy({ 
        clientID: {{ element.values.clientID}}, 
        clientSecret: {{ element.values.clientSecret}},
        callbackURL: {{ element.values.callbackURL}}
      }, async (accessToken, refreshToken, profile, done) => {
          try {
            {{ element.values.customCode }}
            // Check if user already exists by email
            let user = await User.findOne({ email: profile.emails[0].value });
            
            if (user) {
              // Update existing user with Google ID if not already set
              if (!user.googleId) {
                user.googleId = profile.id;
                user.provider = user.provider ? user.provider : 'google';
                await user.save();
              }
              return done(null, user);
            }
            
            // Create new user
            user = new User({
              googleId: profile.id,
              name: profile.displayName,
              email: profile.emails[0].value,
              avatar: profile.photos[0].value,
              provider: 'google',
              isVerified: true // OAuth users are pre-verified
            });
            
            await user.save();
            done(null, user);
          } catch (error) {
            done(error, null);
          }
      }))
*/
