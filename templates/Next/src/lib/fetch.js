/*
path: fetch.js
completePath: /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/src/lib/fetch.js
keyPath: src/lib/fetch.js
unique_id: yo7llWoT
*/
export const fetcher = (...args) => {
  return fetch(...args).then(async (res) => {
    if (res.status > 299) {
      const error = new Error(res.statusText)
      error.info = res
      error.status = res.status
      throw error
    }

    const contentType = res.headers.get('content-type')
    const isJson = contentType && contentType.includes('application/json')

    let payload

    if (res.status === 204) return null

    if (isJson) payload = await res.json()
    else payload = await res.text()

    if (res.ok) {
      return payload
    } else {
      const error = new Error('An error occurred while fetching the data.')
      error.info = payload
      error.status = res.status
      throw error
    }
  })
}
