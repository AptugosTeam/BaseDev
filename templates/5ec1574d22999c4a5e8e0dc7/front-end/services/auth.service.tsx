/*
path: auth.service.tsx
completePath: front-end/services/auth.service.tsx
unique_id: dDixye51
*/
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
          localStorage.setItem('token', response.data.accessToken)
          localStorage.setItem('user', JSON.stringify(response.data.data))
        }
        return response.data
      })
  }

  logout() {
    localStorage.removeItem('user')
    localStorage.removeItem('token')
  }

  register(data) {
    return axios.post(API_URL, data).then(_result => {
      return this.login(data.Email, data.Password).then(afterLogin => { return afterLogin})
    }).catch(e => { throw e })
  }

  async getCurrentUser() {
    const user = localStorage.getItem('user')
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
        localStorage.setItem('token', response.data.accessToken)
        localStorage.setItem('user', JSON.stringify(response.data.data))
        return response.data.data._id
      })
  }
}

export default new AuthService()
