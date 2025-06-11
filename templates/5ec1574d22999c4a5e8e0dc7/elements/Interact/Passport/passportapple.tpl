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
settings:
  - name: BackendPackages
    value: '"passport": "^0.7.0", "passport-apple": "^2.0.2",'
  - name: ServerAddenum
    value: |-
      const passport = require('passport')
      const AppleStrategy = require('passport-apple');

      passport.use(new AppleStrategy({
        clientID: process.env.APPLE_CLIENT_ID,
        teamID: process.env.APPLE_TEAM_ID,
        keyID: process.env.APPLE_KEY_ID,
        privateKeyLocation: process.env.APPLE_PRIVATE_KEY_PATH,
        callbackURL: "/auth/apple/callback",
        scope: {{ element.values.customCode | default('['name', 'email']') }}
      }, async (accessToken, refreshToken, idToken, profile, done) => {
          try {
            {{ element.values.customCode }}
            let user = await User.findOne({ email: profile.email });
            
            if (user) {
              if (!user.appleId) {
                user.appleId = profile.id;
                user.provider = user.provider ? user.provider : 'apple';
                await user.save();
              }
              return done(null, user);
            }
            
            user = new User({
              appleId: profile.id,
              name: profile.name ? `${profile.name.firstName} ${profile.name.lastName}` : 'Apple User',
              email: profile.email,
              provider: 'apple',
              isVerified: true
            });
            
            await user.save();
            done(null, user);
          } catch (error) {
            done(error, null);
          }
      }))
*/
