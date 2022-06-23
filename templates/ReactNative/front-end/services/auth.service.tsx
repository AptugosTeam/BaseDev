/*
path: auth.service.tsx
completePath: front-end/services/auth.service.tsx
unique_id: dDixye51
*/
import AsyncStorage from '@react-native-async-storage/async-storage'
import axios from 'axios'

const API_URL = '{{ settings.apiURL }}/api/users/'

class AuthService {
  login(email, password) {
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
      })
      .then((response) => {
        if (response.data.accessToken) {
          AsyncStorage.setItem('token', response.data.accessToken)
          AsyncStorage.setItem('user', JSON.stringify(response.data.data))
        }
        return response.data
      })
  }

  logout() {
    // localStorage.removeItem('user')
    // localStorage.removeItem('token')
  }

  register(username, email, password) {
    return axios.post(API_URL + 'signup', {
      username,
      email,
      password,
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
}

export default new AuthService()
