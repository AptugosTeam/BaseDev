import axios from 'axios';

let API_URL = 'http://127.0.0.1:4567/api/users/';

class AuthService {
  login(email, password, model = '') {
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
        model,
      })
      .then((response) => {
        if (response.data.accessToken) {
          localStorage.setItem('token', response.data.accessToken);
          localStorage.setItem('user', JSON.stringify(response.data.data));
        }
        return response.data;
      });
  }

  logout() {
    localStorage.removeItem('user');
    localStorage.removeItem('token');
  }

  register(username, email, password) {
    return axios.post(API_URL + 'signup', {
      username,
      email,
      password,
    });
  }

  getCurrentUser() {
    return JSON.parse(localStorage.getItem('user'));
  }

  recoverPassword({ email, subject, message, name, model = '' }) {
    return axios
      .post(API_URL + 'recoverpassword', {
        email,
        subject,
        message,
        name,
        model,
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
