/*
path: 999_passportMiddleware.js
completePath: >-
  /Users/robrondon/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Interact/Passport/999_passportMiddleware.js
keyPath: elements/Interact/Passport/999_passportMiddleware.js
unique_id: oRCZTMPT
*/
const isAuthenticated = (redirectURL) => (req, res, next) => {
  if (req.isAuthenticated()) {
    return next()
  }
  return res.redirect(redirectURL)
}

module.exports = {
  isAuthenticated,
}
