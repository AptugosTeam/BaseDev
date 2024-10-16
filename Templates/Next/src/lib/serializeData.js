/*
path: serializeData.js
completePath: /Users/Shared/Dev/BaseDev/Templates/Next/src/lib/serializeData.js
keyPath: src/lib/serializeData.js
unique_id: GkGZBdWE
*/
const isFile = (input) => 'File' in window && input instanceof File
function serializeData(data) {
  const formData = new FormData()

  Object.keys(data).forEach((key) => {
    if (isFile(data[key])) {
      formData.append(key, data[key])
    } else {
      if (typeof data[key] === 'object') {
        formData.append(key, JSON.stringify(data[key]))
      } else {
        formData.append(key, data[key])
      }
    }
  })

  return formData
}

export default serializeData