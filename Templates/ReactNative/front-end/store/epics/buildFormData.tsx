/*
path: buildFormData.tsx
completePath: front-end/store/epics/buildFormData.tsx
unique_id: 2yDQTrrLe
*/

export default function buildFormData(formData:any, data:any, parentKey:any = null) {
  Object.keys(data).forEach((key) => {
    if (data[key]) {
      let savekey = key
      if (parentKey) savekey = `${parentKey}___${key}`
      let value = data[key] == null ? '' : data[key]
      if (typeof data[key] === 'object' && data[key].uri) {
        formData.append(savekey, value)
      } else if (typeof data[key] === 'object') {
        buildFormData(formData, data[key], savekey)  
      } else {
        formData.append(savekey, value)
      }
    }
  })
}