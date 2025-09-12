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
    const value = data[key];

    if (isFile(value)) {
      formData.append(key, value);
    } 
    
    else if (Array.isArray(value) && value.every(isFile)) {
      value.forEach(file => {
        formData.append(key, file)
      })
    } 

    else {
      if (typeof value === 'object' && value !== null) {
        formData.append(key, JSON.stringify(value))
      } else {
        formData.append(key, value)
      }
    }
  })

  return formData
}

export default serializeData
