/*
path: auth.service.tsx
completePath: front-end/services/auth.service.tsx
unique_id: dDixye51
*/
import axios from 'axios'

{% set url = settings.apiURL ~ '/api/' %}
{% set customUrl = insert_setting('customApiUrl') %}
{% if customUrl %}
const API_URL = `{{ customUrl }}/api/`
{% else %}
const API_URL = '{{ url }}'
{% endif %}


interface LoginOptions {
  remember?: boolean;
  validate?: boolean;
  lang?: string;
  validationDNI?: RecoverOptions;
}

interface RecoverOptions {
  DNI: string;
  subject: string;
  message: string;
  name: string;
  model?: string;
  lang?: string;
  username?: string;
}

class AuthService {
  login(DNI, password) {
    return axios
      .post(API_URL + 'authenticate', {
        DNI,
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

  loginWithSession(DNI, password, fullUser = true, fieldsToRetrieve = [], lang = 'en') {
    return axios
      .post(this.apiUrl + 'authenticate', {
        DNI,
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
      .post(this.apiUrl + 'socialauthenticate', {
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

  async logout() {
    localStorage.removeItem('user')
    localStorage.removeItem('token')
  }

  register(data) {
    return axios.post(API_URL, data).then(_result => {
      return this.login(data.DNI, data.Password).then(afterLogin => { return afterLogin})
    }).catch(e => { throw e })
  }

  async getCurrentUser() {
    const user = JSON.parse(localStorage.getItem('user'))
    return user
  }

  recoverPassword({ DNI, subject, message, name, model = '', lang = 'en', username = '' }) {
    return axios
      .post(this.apiUrl + 'recoverpassword', {
        DNI,
        subject,
        message,
        name,
        model, 
        lang,
        username
      })
      .then((response) => {
        return response.data
      })
  }

  checkNonce(nonce, DNI) {
    return axios
      .post(this.apiUrl + 'checknonce', {
        nonce,
        DNI,
      })
      .then((response) => {
        localStorage.setItem('token', response.data.accessToken)
        localStorage.setItem('user', JSON.stringify(response.data.data))
        return response.data.data._id
      })
      .catch((e) => {
        throw e;
      });
  }
}

export default new AuthService()
