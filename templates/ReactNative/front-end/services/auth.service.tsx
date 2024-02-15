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

class AuthService {
  login(email, password) {
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
      })
      .then((response) => {
        if (response.data.stsTokenManager) {
          AsyncStorage.setItem('token', JSON.stringify(response.data.stsTokenManager.accessToken))
          AsyncStorage.setItem('user', JSON.stringify(response.data))
        }
        return response.data
      }).catch((error) => {
        throw error.response.data
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
    const user = await AsyncStorage.getItem('user')
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

  {{ insert_setting('AuthServiceAddenum') | raw }}
}

export default new AuthService()
