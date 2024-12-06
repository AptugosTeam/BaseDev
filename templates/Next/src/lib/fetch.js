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
    
    let payload
    
    if (res.status === 204) return null
    payload = await res.json()
    
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
