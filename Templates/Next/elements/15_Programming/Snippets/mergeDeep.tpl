/*
path: mergeDeep.tpl
completePath: elements/Programming/Snippets/mergeDeep.tpl
type: file
unique_id: mergeDeep
icon: f:mergeDeep.svg
sourceType: javascript
helpText: Merges several objects with all their properties
*/
const mergeDeep = (...objects) => {
  const isObject = (obj) => obj && typeof obj === 'object'

  return objects.reduce((prev, obj) => {
    Object.keys(obj).forEach((key) => {
      const pVal = prev[key]
      const oVal = obj[key]

      if (Array.isArray(pVal) && Array.isArray(oVal)) {
        prev[key] = pVal.concat(...oVal)
      } else if (isObject(pVal) && isObject(oVal)) {
        prev[key] = mergeDeep(pVal, oVal)
      } else {
        prev[key] = oVal
      }
    })

    return prev
  }, {})
}