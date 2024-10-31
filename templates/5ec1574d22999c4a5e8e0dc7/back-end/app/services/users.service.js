/*
path: users.service.js
completePath: back-end/app/services/users.service.js
unique_id: aOViR3kP
*/
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const errors = require('../services/errors.service')
const crypto = require('crypto')

module.exports = {
  authenticate,
  cryptPassword,
  jwtVerify,
  recoverPassword,
  checkNonce,
  socialAuthenticate,
  dataEncryption
}

const errorMessages = {
  en: {
    wrong: "Wrong parameters sent",
    email: "Email not found",
    badNonce: "Bad bad nonce",
    notPassword: "User does not have a password",
    wrongPassword: "Password incorrect",
    error: "There was an error",
    token: "Error, token could not be generated",
    unauthorized: "Unauthorized",
    failed: 'Something failed',
    unverified: 'Account not validated. Please check your email to validate your account'
  },
  es: {
    wrong: "La información enviada no es válida",
    email: "Email no encontrado",
    badNonce: "Código incorrecto",
    notPassword: "El usuario no tiene contraseña",
    wrongPassword: "Contraseña incorrecta",
    error: "Ocurrió un error",
    token: "Error, no se pudo generar el token",
    unauthorized: "Acceso denegado",
    failed: 'Ocurrió un error',
    unverified: 'Cuenta no validada. Por favor revisa tu correo electrónico para validar tu cuenta'
  },
};

async function recoverPassword (req) {
  let { name, email, message, subject, model, lang = "en", username } = req.body;
  if (!model) {
    const Users = require('../models/users.model.js')
    model = Users
  } else if (typeof model === 'string') {
    const Users = require('../models/' + model + '.model.js')
    model = Users
  }

  return new Promise(function (resolve, reject) {
    if (!email) reject({ message: errorMessages[lang].wrong })
    const query = model.findOne({ Email: email })
    const promise = query.exec()

    promise.then(async (user) => {
      if (!user) {
        reject({ message: errorMessages[lang].email })
        return
      }
      const { Password, ...userWithoutPassword } = user._doc
      const nonce = Buffer.from(bcrypt.hashSync(JSON.stringify(userWithoutPassword), Password)).toString('base64')
      let parsedmessage = message.replace('**nonce**', nonce)
      parsedmessage = parsedmessage.replace('**email**', Buffer.from(userWithoutPassword.Email).toString('base64'))
      if (username) parsedmessage = parsedmessage.replace('**username**', userWithoutPassword[username])

      try {
        const emailResponse = await req.app.get('sendEmail')({ name, email, message: parsedmessage, subject })
        resolve({ user, emailResponse })
      } catch (error) {
        reject({ message: errorMessages[lang].failed })
      }
    })
  })
}

async function checkNonce (req) {
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
      if (user) {
        const { Password, ...userWithoutPassword } = user._doc
        bcrypt.compare(JSON.stringify(userWithoutPassword), ascii).then((isMatch) => {
          if (isMatch) {
            const token = jwt.sign(userWithoutPassword, 'thisisthesecretandshouldbeconfigurable', { expiresIn: '7d' })
            resolve({ accessToken: token, data: userWithoutPassword })
          } else {
            reject({ message: 'Bad bad nonce' })
          }
        })
          .catch(e => {
            reject({ message: 'Bad bad nonce' })
          })
      } else {
        reject({ message: 'Bad bad nonce' })
      }
    })
  })
}

async function authenticate ({ email, password, model, passwordField, populate, options = {} }) {
  const { fullUser = true, fieldsToRetrieve = [], lang = 'en', validate = false } = options
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
    if (!email || !password) reject({ message: errorMessages[lang].wrong })
    const query = model.findOne({ Email: new RegExp('^' + email.toLowerCase(), 'i') })
    if (populate) query.populate(populate)
    const promise = query.exec()

    promise.then((user) => {
      if (!user) {
        return reject({ message: errorMessages[lang].email })
      }

      if (!user[passwordField]) reject({ message: errorMessages[lang].notPassword, user: user })
      else {
        bcrypt.compare(password, user[passwordField]).then((isMatch) => {
          if (isMatch) {
            const { Password, ...userWithoutPassword } = user._doc
            const { _id } = userWithoutPassword
            const userID = { id: _id, _id }
            if (!fullUser) {
              fieldsToRetrieve.map((fieldName) => {
                userID[fieldName] = userWithoutPassword[fieldName]
              })
            }
            if (validate && !user.Verified) reject({ message: errorMessages[lang].unverified, user: { Email: user.Email, Verified: user.Verified } })
            const secretKey = process.env.PASSPORT_SECRET || 'thisisthesecretandshouldbeconfigurable'
            const token = jwt.sign(fullUser ? userWithoutPassword : userID, secretKey, { expiresIn: '7d' })
            resolve({ accessToken: token, data: fullUser ? userWithoutPassword : userID })
          } else {
            reject({ message: errorMessages[lang].wrongPassword })
          }

        })
      }
    })
  })
}

async function socialAuthenticate ({ Name, ProfilePic, Email, Role }) {
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

function cryptPassword (password) {
  const hash = bcrypt.hashSync(password, 10)
  return hash
}

function jwtVerify (token) {
  if (token) {
    const justTheToken = token.substr(token.indexOf(' ') + 1)
    try {
      const secretKey = process.env.PASSPORT_SECRET || 'thisisthesecretandshouldbeconfigurable'
      const decoded = jwt.verify(justTheToken, secretKey)
      return decoded
    } catch (e) {
      return { error: e.message }
    }
  } else {
    return { error: 'Unauthorized' }
  }
}

/**
 * Encrypts or decrypts data using AES-256-CBC algorithm.
 *
 * @param {string} data - The data to be encrypted or decrypted.
 * @param {string} [type='encrypt'] - The operation type. Use 'encrypt' to encrypt data or 'decrypt' to decrypt.
 * @param {string} [secret='my secret key'] - The secret key used for encryption or decryption.
 * @returns {string} The encrypted or decrypted data.
 * @throws {Error} If an invalid type is provided or an error occurs during encryption/decryption.
 *
 * @example
 * // Encrypt data
 * const encryptedData = dataEncryption('Hello, World!', 'encrypt', 'my secret key');
 * console.log(encryptedData);
 *
 * // Decrypt data
 * const decryptedData = dataEncryption(encryptedData, 'decrypt', 'my secret key');
 * console.log(decryptedData);
 */
function dataEncryption (data, type = 'encrypt', secret = 'my secret key') {
  try {
    const algorithm = 'aes-256-cbc';
    const key = crypto.scryptSync(secret, 'salt', 32);
    const iv = Buffer.alloc(16, 0);
    const cipher = crypto.createCipheriv(algorithm, key, iv);
    const decipher = crypto.createDecipheriv(algorithm, key, iv);

    if (!data) {
      return data
    }

    if (type === 'encrypt') {
      let encrypted = cipher.update(data, 'utf8', 'hex');
      encrypted += cipher.final('hex');
      return encrypted
    }

    if (type === 'decrypt') {
      if (!/^[0-9a-fA-F]+$/.test(data)) {
        console.warn('Input data is not a valid hex string. Returning original data.');
        return data;
      }
      let decrypted = decipher.update(data, 'hex', 'utf8');
      decrypted += decipher.final('utf8');
      return decrypted
    }

    throw new Error('Invalid type. Use "encrypt" or "decrypt".');
  } catch (error) {
    console.error('Error in encrypDecrypt:', error);
    throw error;
  }
}