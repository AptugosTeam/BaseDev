/*
path: NotificationBannerService.tsx
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/ReactNative/elements/99_ExtraFiles/NotificationBannerService.tsx
keyPath: elements/99_ExtraFiles/NotificationBannerService.tsx
unique_id: Vp819aZZ
*/
type NotifyPayload = {
  fromName?: string
  message?: string
  avatar?: string
  onPress?: () => void
  duration?: number // ms
}

let _showFn: ((p: NotifyPayload) => void) | null = null

export const registerNotificationHandler = (fn: (p: NotifyPayload) => void) => {
  _showFn = fn
}

export const unregisterNotificationHandler = () => {
  _showFn = null
}

export const showNotification = (payload: NotifyPayload) => {
  if (_showFn) _showFn(payload)
  else console.warn('Notification handler not registered yet')
}