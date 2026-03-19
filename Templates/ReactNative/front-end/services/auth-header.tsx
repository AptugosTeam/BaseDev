/*
path: auth-header.tsx
completePath: front-end/services/auth-header.tsx
unique_id: kvycd8W9
*/
import AsyncStorage from '@react-native-async-storage/async-storage'
import axios from 'axios'

const authHeaders = async () => {
  const token = await AsyncStorage.getItem('token')
  if (token) {
    axios.defaults.headers.common['Authorization'] = token
    return true
  } else {
    axios.defaults.headers.common['Authorization'] = null
    return false
  }
}

export default authHeaders
