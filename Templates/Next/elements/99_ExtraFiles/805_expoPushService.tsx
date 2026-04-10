/*
path: 805_expoPushService.tsx
completePath: >-
  /home/user/Aptugo/BaseDev/Templates/Next/elements/99_ExtraFiles/805_expoPushService.tsx
keyPath: elements/99_ExtraFiles/805_expoPushService.tsx
unique_id: VZ0BT3ov
*/

export const sendPushNotification = async (pushToken, title, body, data = {}) => {
  const message = {
    to: pushToken,
    sound: 'default',
    title: title || 'Notification',
    body: body || '',
    data: data,
  }

  try {
    const response = await fetch('https://exp.host/--/api/v2/push/send', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify(message),
    })

    const result = await response.json()

    if (!response.ok || result?.errors?.length) {
      console.error('Error sending Expo push notification:', result)
      throw new Error(result?.errors?.[0]?.message || 'Expo push request failed')
    }

    return result
  } catch (error) {
    console.error('Error sending Expo push notification:', error)
    throw error
  }
}
