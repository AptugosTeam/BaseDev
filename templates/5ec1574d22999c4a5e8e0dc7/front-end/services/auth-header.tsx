/*
path: auth-header.tsx
completePath: front-end/services/auth-header.tsx
unique_id: kvycd8W9
*/
import axios from "axios"

const authHeaders = async () => {
  let token = null;

  if (localStorage.getItem('user') && localStorage.getItem('token')) {
    token = localStorage.getItem('token');
    console.log('Using token from localStorage');
  } else if (sessionStorage.getItem('userSession') && sessionStorage.getItem('tokenSession')) {
    token = sessionStorage.getItem('tokenSession');
    console.log('Using token from sessionStorage userSession');
  } else if (sessionStorage.getItem('user') && sessionStorage.getItem('token')) {
    token = sessionStorage.getItem('token');
    console.log('Using token from sessionStorage user');
  }

  if (token) {
    axios.defaults.headers.common['Authorization'] = token
    return true
  } else {
    axios.defaults.headers.common['Authorization'] = null
    return false
    /*if setting null does not remove `Authorization` header then try     
        delete axios.defaults.headers.common['Authorization'];
      */
  }
};

export default authHeaders

