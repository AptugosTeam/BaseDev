/*
path: users.service.js
completePath: back-end/app/services/users.service.js
unique_id: aOViR3kP
*/
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')

module.exports = {
  authenticate,
  cryptPassword,
  jwtVerify,
  recoverPassword,
  checkNonce,
  socialAuthenticate
}

async function recoverPassword(req) {
  let { name, email, message, subject, model } = req.body
  if (!model) {
    const Users = require('../models/users.model.js')
    model = Users
  } else if (typeof model === 'string') {
    const Users = require('../models/' + model + '.model.js')
    model = Users
  }

  return new Promise(function (resolve, reject) {
    if (!email) reject({ message: 'Wrong parameters sent' })
    const query = model.findOne({ Email: email })
    const promise = query.exec()

    promise.then((user) => {
      if (!user) {
        reject({ message: 'Email not found' })
      }
      const { Password, ...userWithoutPassword } = user._doc
      const nonce = Buffer.from(bcrypt.hashSync(JSON.stringify(userWithoutPassword), Password)).toString('base64')
      let parsedmessage = message.replace('**nonce**', nonce)
      parsedmessage = parsedmessage.replace('**email**', Buffer.from(userWithoutPassword.Email).toString('base64'))
      req.app.get('sendEmail')({ name, email, message: parsedmessage, subject })
      resolve(user)
    })
  })
}

async function checkNonce(req) {
  return new Promise(function (resolve, reject) {
    let { nonce, email, model } = req.body
    if (!model) {
      const Users = require('../models/users.model.js')
      model = Users
    } else if (typeof model === 'string') {
      const Users = require('../models/' + model + '.model.js')
      model = Users
    }

    const asciiEMail = Buffer.from(email, 'base64').toString('ascii')
    const ascii = Buffer.from(nonce, 'base64').toString('ascii')
    const query = model.findOne({ Email: asciiEMail })
    const promise = query.exec()
    promise.then((user) => {
      const { Password, ...userWithoutPassword } = user._doc
      bcrypt.compare(JSON.stringify(userWithoutPassword), ascii).then((isMatch) => {
        if (isMatch) {
          const token = jwt.sign(userWithoutPassword, 'thisisthesecretandshouldbeconfigurable', { expiresIn: '7d' })
          resolve({ accessToken: token, data: userWithoutPassword })
        } else {
          reject({ message: 'Bad bad nonce' })
        }
      })
    })
  })
}

async function authenticate({ email, password, model, passwordField }) {
  if (!model) {
    const Users = require('../models/users.model.js')
    model = Users
  } else if (typeof model === 'string') {
    const Users = require('../models/' + model + '.model.js')
    model = Users
  }

  if (!passwordField) {
    passwordField = 'Password'
  }
  return new Promise(function (resolve, reject) {
    if (!email || !password) reject({ message: 'Wrong parameters sent' })
    const query = model.findOne({ Email: new RegExp('^' + email.toLowerCase(), 'i') })
    const promise = query.exec()

    promise.then((user) => {
      if (!user) {
        return reject({ message: 'Email not found' })
      }

      if (!user[passwordField]) reject({ message: 'User does not have a password', user: user })
      else {
        bcrypt.compare(password, user[passwordField]).then((isMatch) => {
          if (isMatch) {
            const { Password, ...userWithoutPassword } = user._doc
            const token = jwt.sign(userWithoutPassword, 'thisisthesecretandshouldbeconfigurable', { expiresIn: '7d' })
            resolve({ accessToken: token, data: userWithoutPassword })
          } else {
            reject({ message: 'Password incorrect' })
          }
        })
      }
    })
  })
}

async function socialAuthenticate({Name, ProfilePic, Email, Role}) {
  console.log("Este es el service", Name, ProfilePic, Email, Role)
    const Users = require('../models/users.model.js')
  return new Promise(function (resolve, reject) {
    const query = Users.findOne({ Email: new RegExp('^' + Email.toLowerCase(), 'i') })
    const promise = query.exec()
    promise.then((user) => {
      console.log("Y esteeeeee",user) 
      if (!user) {
        const data = {
          Email,
          Password: 123,
          Role
        }
        user = new Users(data)

        user.save()
      .then((result) => {{
          resolve(result)
        }
      })
      .catch((err) => {
        reject(errors.prepareError(err))
      })
      }
      const { Password, ...userWithoutPassword } = user._doc
      console.log("Without pass",userWithoutPassword)
      const token = jwt.sign(userWithoutPassword, 'thisisthesecretandshouldbeconfigurable', { expiresIn: '7d' })
      console.log("token",token)
      if(token){
        resolve({ accessToken: token, data: userWithoutPassword })}
      else {
        reject({ message: 'Error, no se pudo generar el token' })
      }
    })
  })
}

function cryptPassword(password) {
  const hash = bcrypt.hashSync(password, 10)
  return hash
}

function jwtVerify(token) {
  if (token) {
    const justTheToken = token.substr(token.indexOf(' ') + 1)
    try {
      const decoded = jwt.verify(justTheToken, 'thisisthesecretandshouldbeconfigurable')
      return decoded
    } catch (e) {
      return { error: e.message }
    }
  } else {
    return { error: 'Unauthorized' }
  }
}
