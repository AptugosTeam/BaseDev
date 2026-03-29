/*
path: api.tsx
completePath: front-end/services/api.tsx
unique_id: DlgwMbcA
*/
const rawApiBaseUrl = process.env.EXPO_PUBLIC_API_URL?.trim()

if (!rawApiBaseUrl) {
  throw new Error('Missing EXPO_PUBLIC_API_URL. Define it in the React Native environment files before starting the app.')
}

const ABSOLUTE_URL_PATTERN = /^(?:[a-zA-Z][a-zA-Z\d+\-.]*:)?\/\//

export const API_BASE_URL = rawApiBaseUrl.replace(/\/+$/, '')

export const resolveApiUrl = (path = '') => {
  const normalizedPath = `${path}`.trim()

  if (!normalizedPath) return API_BASE_URL
  if (ABSOLUTE_URL_PATTERN.test(normalizedPath)) return normalizedPath

  return `${API_BASE_URL}/${normalizedPath.replace(/^\/+/, '')}`
}
