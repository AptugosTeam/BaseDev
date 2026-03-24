/*
path: userSlice.tsx
completePath: >-
  /home/user/Aptugo/BaseDev/Templates/ReactNative/front-end/store/slices/userSlice.tsx
keyPath: front-end/store/slices/userSlice.tsx
unique_id: teNiHzMM
*/
import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import reducers from 'store/reducers'

export interface UserState {
  userData: any | null
  isAuthenticated: boolean
}

const initialState: UserState = {
  userData: null,
  isAuthenticated: false,
}

export const userSlice = createSlice({
  name: 'user',
  initialState,
  reducers: {
    setUser: (state, action: PayloadAction<any>) => {
      state.userData = action.payload
      state.isAuthenticated = true
    },
    clearUser: (state) => {
      state.userData = null
      state.isAuthenticated = false
    },
  },
})

export const { setUser, clearUser } = userSlice.actions

export default userSlice.reducer