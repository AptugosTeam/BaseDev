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

const BASE_API_URL = '{{ settings.apiURL }}/api/'

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
  getModelPath(model: string | null = null) {
    return `${BASE_API_URL}${model || 'users'}`
  }

  login(email, password, model: string | null = null, options: LoginOptions = {}) {
    const { remember = false } = options
    return axios
      .post(`${this.getModelPath('users')}/authenticate`, {
        email,
        password,
        model,
        options,
      })
      .then((response) => {
        if (response.data.accessToken || response.data.stsTokenManager) {
          const token = response.data.accessToken || response.data.stsTokenManager
          const userData = JSON.stringify(response.data.data || response.data)
          
          if (remember) {
            AsyncStorage.setItem('token', token)
            AsyncStorage.setItem('user', userData)
          }
        }
        return response.data
      })
  }

  logout() {
    AsyncStorage.removeItem('user')
    AsyncStorage.removeItem('token')
  }

  register(data, model: string | null = null) {
    return axios
      .post(this.getModelPath(model), data)
      .then((_result) => {
        return this.login(data.Email, data.Password, model).then((afterLogin) => {
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
      const response = await axios.post(`${this.getModelPath(model)}/recoverpassword`, {
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
      const errorMessage = error.response?.data?.message || 'An error occurred while recovering the password'
      console.error('Error while recovering password:', errorMessage)
      return { success: false, error: errorMessage }
    }
  }
  
  checkNonce(nonce, email, model: string | null = null) {
    return axios
      .post(`${this.getModelPath(model)}/checknonce`, {
        nonce,
        email,
      })
      .then((response) => {
        AsyncStorage.setItem('token', response.data.accessToken)
        AsyncStorage.setItem('user', JSON.stringify(response.data.data))
        return response.data.data._id
      })
      .catch((e) => {
        throw e
      })
  }
{{ insert_setting('auth.service') | raw }}
}

export default new AuthService()