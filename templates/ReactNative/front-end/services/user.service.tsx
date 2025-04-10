/*
path: user.service.tsx
completePath: front-end/services/user.service.tsx
unique_id: QcDotLgm
*/
import axios from 'axios';
import authHeader from './auth-header';

const API_URL = "{{ settings.apiURL }}/api/users/";

class UserService {
  getPublicContent() {
    return axios.get(API_URL + 'all');
  }

  getUserBoard() {
    return axios.get(API_URL + 'user', { headers: authHeader() });
  }

  getModeratorBoard() {
    return axios.get(API_URL + 'mod', { headers: authHeader() });
  }

  getAdminBoard() {
    return axios.get(API_URL + 'admin', { headers: authHeader() });
  }
  {{ insert_setting('user.service') | raw}}

}

export default new UserService();