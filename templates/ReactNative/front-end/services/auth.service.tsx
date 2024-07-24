/*
path: auth.service.tsx
completePath: front-end/services/auth.service.tsx
unique_id: dDixye51
settings:
  - name: Packages
    value: '"@react-native-async-storage/async-storage": "1.18.2",'
*/
import AsyncStorage from '@react-native-async-storage/async-storage'
import axios from 'axios'
{{ insert_setting('AuthServiceImports') | raw }}

const API_URL = '{{ settings.apiURL }}/api/users/'

interface LoginOptions {
  remember?: boolean
  validate?: boolean
  lang?: string
  validationEmail?: RecoverOptions
}
interface RecoverOptions {
  email: string
  subject: string
  message: string
  name: string
  model?: string
  lang?: string
  username?: string
}

class AuthService {
  login(email, password, options: LoginOptions = {}) {
    const { remember = true } = options
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
        options,
      })
      .then((response) => {
        if (response.data.accessToken || response.data.stsTokenManager) {
          if (remember) {
            AsyncStorage.setItem('token', response.data.accessToken || response.data.stsTokenManager)
            AsyncStorage.setItem('user', JSON.stringify(response.data.data || response.data))
          } else {
            AsyncStorage.setItem('token', response.data.accessToken || response.data.stsTokenManager)
            AsyncStorage.setItem('user', JSON.stringify(response.data.data || response.data))
          }
        }
        return response.data
      })
  }

  logout() {
    AsyncStorage.removeItem('user')
    AsyncStorage.removeItem('token')
  }

  register(data) {
    return axios
      .post(API_URL + 'register', data)
      .then((_result) => {
        return this.login(data.Email, data.Password).then((afterLogin) => {
          return afterLogin
        })
      })
      .catch((error) => {
        throw error.response.data
      })
  }

  async getCurrentUser() {
    const user = await AsyncStorage.getItem('user') || await AsyncStorage.getItem('userSession') || await AsyncStorage.getItem('user')
    return user ? JSON.parse(user) : {}
  }

  recoverPassword({ email, subject, message, name }) {
    return axios
      .post(API_URL + 'recoverpassword', {
        email,
        subject,
        message,
        name,
      })
      .then((response) => {
        return response.data
      })
  }

  checkNonce(nonce, email) {
    return axios
      .post(API_URL + 'checknonce', {
        nonce,
        email,
      })
      .then((response) => {
        // localStorage.setItem('token', response.data.accessToken)
        // localStorage.setItem('user', JSON.stringify(response.data.data))
        return response.data.data._id
      })
  }
}

export default new AuthService()

