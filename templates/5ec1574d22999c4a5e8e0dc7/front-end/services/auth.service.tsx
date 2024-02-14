/*
path: auth.service.tsx
completePath: front-end/services/auth.service.tsx
unique_id: dDixye51
*/
import axios from 'axios'

const API_URL = '{{ settings.apiURL }}/api/users/'

interface LoginOptions {
  remember?: boolean;
}

class AuthService {
  login(email, password, options: LoginOptions = {}) {
    const { remember = true} = options
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
        options,
      })
      .then((response) => {
        if (response.data.accessToken || response.data.stsTokenManager) {
          if(remember) {
            localStorage.setItem(
              'token',
              response.data.accessToken || response.data.stsTokenManager
            );
            localStorage.setItem(
              'user',
              JSON.stringify(response.data.data || response.data)
            );
          } else {
            sessionStorage.setItem('token', response.data.accessToken || response.data.stsTokenManager)
            sessionStorage.setItem('user', JSON.stringify(response.data.data || response.data))
          }
        }
        return response.data;
      });
  }

  loginWithSession(email, password, fullUser = true, fieldsToRetrieve = [], lang = 'en') {
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
        fullUser,
        fieldsToRetrieve,
        lang
      })
      .then((response) => {
        if (response.data.accessToken || response.data.stsTokenManager) {
          sessionStorage.setItem('tokenSession', response.data.accessToken || response.data.stsTokenManager)
          sessionStorage.setItem('userSession', JSON.stringify(response.data.data || response.data))
        }
        return response.data
      })
  }

  socialLogin(data){
    console.log("Authservice",data)
    return axios
      .post(API_URL + 'socialauthenticate', {
        data
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
    localStorage.removeItem('user');
    localStorage.removeItem('token');
    sessionStorage.removeItem('user');
    sessionStorage.removeItem('token');
    sessionStorage.removeItem('userSession');
    sessionStorage.removeItem('tokenSession');
  }

  register(data) {
    return axios.post(API_URL, data).then(_result => {
      return this.login(data.Email, data.Password).then(afterLogin => { return afterLogin})
    }).catch(e => { throw e })
  }

  registerWithSession(data) {
    const { fullUser = true , fieldsToRetrieve = [] } = data
    return axios.post(API_URL, data).then((_result) => {
        return this.loginWithSession(data.Email, data.Password, fullUser, fieldsToRetrieve).then((afterLogin) => { return afterLogin})
      }).catch(e => { throw e })
  }

  async getCurrentUser() {
    const user =
      localStorage.getItem('user') ||
      sessionStorage.getItem('userSession') ||
      sessionStorage.getItem('user');
    return user ? JSON.parse(user) : {}
  }

  recoverPassword({ email, subject, message, name, model = '', lang = 'en' }) {
    return axios
      .post(API_URL + 'recoverpassword', {
        email,
        subject,
        message,
        name,
        model, 
        lang,
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
