/*
path: pushTokenNotificationHook.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/ReactNative/elements/99_ExtraFiles/pushTokenNotificationHook.tsx
keyPath: elements/99_ExtraFiles/pushTokenNotificationHook.tsx
unique_id: EAEpTTTW
*/
import { useEffect, useRef } from 'react'
import AsyncStorage from '@react-native-async-storage/async-storage'
import axios from 'axios'
import * as Device from 'expo-device'
import * as Notifications from 'expo-notifications'

interface UsePushTokenRegisterOptions {
  userId?: string
  endpoint: string
}

async function registerForPushNotificationsAsync() {
  let token
  if (Device.isDevice) {
    const { status: existingStatus } = await Notifications.getPermissionsAsync()
    let finalStatus = existingStatus
    if (existingStatus !== 'granted') {
      const { status } = await Notifications.requestPermissionsAsync()
      finalStatus = status
    }
    if (finalStatus !== 'granted') {
      alert('Failed to get push token for push notification!')
      return
    }
    token = (await Notifications.getExpoPushTokenAsync({ projectId: '{{ element.values.projectId }}' })).data
  }

  return token
}

export function usePushTokenRegister({ userId, endpoint }: UsePushTokenRegisterOptions) {
  const hasRegistered = useRef(false)

  useEffect(() => {
    if (!userId || hasRegistered.current || !Device.isDevice) return

    let isMounted = true
    const registerToken = async () => {
      try {
        const token = await registerForPushNotificationsAsync()
        await AsyncStorage.setItem('mypushtoken', token)

        await axios.post(endpoint, {
          Student: userId,
          Token: token,
          Device: Device.modelName,
        })

        hasRegistered.current = true
      } catch (error) {
        console.error('Error registering push token:', error)
      }
    }

    registerToken()

    return () => {
      isMounted = false
    }
  }, [userId, endpoint])
}