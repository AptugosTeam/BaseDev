/*
path: users.service.js
completePath: back-end/app/services/users.service.js
unique_id: aOViR3kP
*/
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const errors = require('../services/errors.service')

module.exports = {
  authenticate,
  cryptPassword,
  jwtVerify,
  recoverPassword,
  checkNonce,
  socialAuthenticate,
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
    if (!DNI) reject({ message: 'Wrong parameters sent' })
    const query = model.findOne({ DNI: DNI })
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

async function authenticate({ DNI, password, model, passwordField }) {
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
    if (!DNI || !password) reject({ message: 'DNI no encontrado' })
    const query = model.findOne({ DNI: DNI })
    const promise = query.exec()

    promise.then((user) => {
      if (!user) {
        return reject({ message: 'Dni not found' })
      }

      if (!user[passwordField]) reject({ message: 'User does not have a password', user: user })
      else {
        bcrypt.compare(password, user[passwordField]).then((isMatch) => {
          if (isMatch) {
            const { Password, ...userWithoutPassword } = user._doc
            const token = jwt.sign(userWithoutPassword, 'thisisthesecretandshouldbeconfigurable', { expiresIn: '7d' })
            resolve({ accessToken: token, data: userWithoutPassword })
          } else {
            reject({ message: 'Password incorrecta' })
          }
        })
      }
    })
  })
}

async function socialAuthenticate({ Name, ProfilePic, Email, Role }) {
  const Users = require('../models/users.model.js')
  return new Promise(function (resolve, reject) {
    if (!Email) {
      reject({ message: 'There was an error' })
    }
    const query = Users.findOne({ Email: new RegExp('^' + Email.toLowerCase(), 'i') })
    const promise = query.exec()
    promise.then((user) => {
      if (!user) {
        const data = {
          Email,
          Password: 123,
          Role,
        }
        const User = new Users(data)
        User.save()
          .then((result) => {
            const { Email, Role, _id } = result._doc
            const cleanUser = { Email, Role, _id }
            const token = jwt.sign(cleanUser, 'thisisthesecretandshouldbeconfigurable', { expiresIn: '7d' })
            if (token) {
              resolve({ accessToken: token, data: cleanUser })
            } else {
              reject({ message: 'Error, no se pudo generar el token' })
            }
          })
          .catch((err) => {
            reject(errors.prepareError(err))
          })
      } else {
        const { Email, Role, _id } = user._doc
        const cleanUser = { Email, Role, _id }
        const token = jwt.sign(cleanUser, 'thisisthesecretandshouldbeconfigurable', { expiresIn: '7d' })
        if (token) {
          resolve({ accessToken: token, data: cleanUser })
        } else {
          reject({ message: 'Error, no se pudo generar el token' })
        }
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
