/*
path: auth.service.tsx
completePath: >-
  /Users/robrondon/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/front-end/services/auth.service.tsx
keyPath: front-end/services/auth.service.tsx
unique_id: K5MiOG7B
*/
import axios from 'axios';

let API_URL = 'http://127.0.0.1:4567/api/users/';

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
  login(email, password, model: string = '', options: LoginOptions = {}) {
    const { remember = true} = options
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
        model,
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

  register(data, options: LoginOptions = {}) {
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

    return axios
      .post(API_URL, data)
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

  recoverPassword({ email, subject, message, name, model = '', lang = 'en', username = '' }) {
    return axios
      .post(API_URL + 'recoverpassword', {
        email,
        subject,
        message,
        name,
        model, 
        lang,
        username
      })
      .then((response) => {
        return response.data;
      });
  }

  checkNonce(nonce, email, model = '') {
    return axios
      .post(API_URL + 'checknonce', {
        nonce,
        email,
        model,
      })
      .then((response) => {
        localStorage.setItem('token', response.data.accessToken);
        localStorage.setItem('user', JSON.stringify(response.data.data));
        return response.data.data._id;
      });
  }

  changeURL(url) {
    API_URL = url;
  }
}

export default new AuthService();
