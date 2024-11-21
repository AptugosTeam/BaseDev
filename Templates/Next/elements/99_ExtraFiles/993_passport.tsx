/*
path: 993_passport.tsx
keyPath: elements/99_ExtraFiles/993_passport.tsx
unique_id: qyKlQDbZ
*/
import { findUserForAuth, findUserWithEmailAndPassword } from '@api-lib/db'
import passport from 'passport'
import { Strategy as LocalStrategy } from 'passport-local'

passport.serializeUser((user, done) => {
  done(null, user._id)
})

passport.deserializeUser((req, id, done) => {
  console.log('find', id)
  findUserForAuth(req.db, id).then(
    (user) => done(null, user),
    (err) => done(err)
  )
})

passport.use(new LocalStrategy(
  { usernameField: "email", passwordField:"password", passReqToCallback: true },
  function(req, username, password, done) {
    
    findUserWithEmailAndPassword(req.db, username, password).then((user) => {
      console.log('found', user, done.toString())

      req.session.regenerate = (cb) => { cb() }
      req.session.save = (cb) => { cb() }

      if (user) done(null, user)
      else done(null, false, { message: 'Email or password is incorrect' })
    })
  }
))

export default passport
