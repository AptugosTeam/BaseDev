/*
path: auth.service.tsx
completePath: front-end/services/auth.service.tsx
unique_id: dDixye51
*/
import axios from 'axios'

{% set url = settings.apiURL ~ '/api/' %}
{% set customUrl = insert_setting('customApiUrl') %}
{% if customUrl %}
const API_URL = `{{ customUrl }}`
{% else %}
const API_URL = '{{ url }}'
{% endif %}


interface LoginOptions {
  remember?: boolean;
  validate?: boolean;
  lang?: string;
  validationEmail?: RecoverOptions;
}

interface RecoverOptions {
  email: string;
  subject: string;
  message: string;
  name: string;
  model?: string;
  lang?: string;
  username?: string;
}

class AuthService {
  private apiUrl: string;

  constructor(endpoint: string = 'users') {
    this.apiUrl = API_URL + endpoint + '/';
  }

  public setEndpoint(endpoint: string) {
    this.apiUrl = API_URL + endpoint + '/';
  }

  login(email, password, options: LoginOptions = {}) {
    const { remember = true} = options
    return axios
      .post(this.apiUrl + 'authenticate', {
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
      .post(this.apiUrl + 'authenticate', {
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

  logout() {
    localStorage.removeItem('user');
    localStorage.removeItem('token');
    sessionStorage.removeItem('user');
    sessionStorage.removeItem('token');
    sessionStorage.removeItem('userSession');
    sessionStorage.removeItem('tokenSession');
  }

  register(data, options: LoginOptions = {}, url = this.apiUrl) {
    const { validate = false, lang = 'en' } = options;
    const messages = {
      en: {
        success: 'Successful registration, check your email to validate your account',
        invalidEmailSettings: 'Invalid settings for validation email',
      },
      es: {
        success: 'Registro exitoso, revisa tu correo electrónico para validar tu cuenta',
        invalidEmailSettings: 'Configuración inválida para la verificación por email',
      },
    };
    const config = {
      headers: { 'content-type': 'multipart/form-data' },
    }

    return axios
      .post(url, data, config)
      .then((_result) => {
        if (validate) {
          if (
            !options.validationEmail ||
            Object.keys(options.validationEmail).length === 0
          )
            throw messages[lang].invalidEmailSettings;
          return this.recoverPassword(options.validationEmail)
            .then((_result) => {
              return {
                message: messages[lang].success,
              };
            })
            .catch((e) => { throw e });
        } else {
          return this.login(data.Email, data.Password, options).then(
            (afterLogin) => {
              return afterLogin;
            }
          );
        }
      })
      .catch((e) => { throw e });
  }

  registerWithSession(data) {
    const { fullUser = true , fieldsToRetrieve = [] } = data
    return axios.post(this.apiUrl, data).then((_result) => {
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

  recoverPassword({ email, subject, message, name, model = '', lang = 'en', username = '' }) {
    return axios
      .post(this.apiUrl + 'recoverpassword', {
        email,
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

  checkNonce(nonce, email) {
    return axios
      .post(this.apiUrl + 'checknonce', {
        nonce,
        email,
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
