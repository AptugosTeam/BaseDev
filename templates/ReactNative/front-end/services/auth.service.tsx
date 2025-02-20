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

interface LoginOptions {
  remember?: boolean
  validate?: boolean
  lang?: string
  validationEmail?: RecoverOptions
}
interface RecoverOptions {
  email: string
  subject: string
  message: string
  name: string
  model?: string
  lang?: string
  username?: string
}

class AuthService {
  login(email, password, options: LoginOptions = {}) {
    const { remember = true } = options
    return axios
      .post(API_URL + 'authenticate', {
        email,
        password,
        options,
      })
      .then((response) => {
        if (response.data.accessToken || response.data.stsTokenManager) {
          if (remember) {
            AsyncStorage.setItem('token', response.data.accessToken || response.data.stsTokenManager)
            AsyncStorage.setItem('user', JSON.stringify(response.data.data || response.data))
          } else {
            AsyncStorage.setItem('token', response.data.accessToken || response.data.stsTokenManager)
            AsyncStorage.setItem('user', JSON.stringify(response.data.data || response.data))
          }
        }
        return response.data
      })
  }

  logout() {
    AsyncStorage.removeItem('user')
    AsyncStorage.removeItem('token')
  }

  register(data) {
    return axios
      .post(API_URL, data)
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
    const user = (await AsyncStorage.getItem('user')) || (await AsyncStorage.getItem('userSession')) || (await AsyncStorage.getItem('user'))
    return user ? JSON.parse(user) : {}
  }

  async recoverPassword({
    email,
    subject,
    message,
    name,
    model = '',
    lang = 'en',
    username = ''
  }: RecoverOptions): Promise<{ success: boolean; data?: any; error?: string }> {
    try {
      const response = await axios.post(`${API_URL}recoverpassword`, {
        email,
        subject,
        message,
        name,
        model,
        lang,
        username
      })

      return { success: true, data: response.data }
    } catch (error) {
      console.log(error)
      const errorMessage = error.response?.data?.message || 'An error occurred while recovering the password';
      console.error('Error while recovering password:', errorMessage)
      return { success: false, error: errorMessage }
    }
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
      .catch((e) => {
        throw e
      })
  }
}

export default new AuthService()