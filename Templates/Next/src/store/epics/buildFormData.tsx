/*
path: buildFormData.tsx
completePath: front-end/store/epics/buildFormData.tsx
unique_id: 2yDQTrrLe
*/

export default function buildFormData(formData, data, parentKey = null) {
  Object.keys(data).forEach((key) => {
    if (data[key] !== undefined || typeof data[key] === 'boolean') {
      let savekey = key
      let value = data[key] === null && typeof data[key] === 'string' ? '' : data[key]
      if (data[key] && typeof data[key] === 'object' && !(data[key] instanceof Date) && !(data[key] instanceof File)) {
        value = JSON.stringify(data[key])
      }

      if (data[key] && Array.isArray(data[key]) && data[key][0] instanceof File) {
        // handle array of filess
        Object.keys(data[key]).forEach((subkey) => {
          formData.append(`${savekey}[${subkey}]`, data[key][subkey])
        })
      } else {
        formData.append(savekey, value)
      }
    }
  })
}
