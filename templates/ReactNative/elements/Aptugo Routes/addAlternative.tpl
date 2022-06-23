/*
path: addAlternative.tpl
type: file
unique_id: uGLTtaRR
icon: field
children: []
*/
{% if table.beforeCreate %}{{ table.beforeCreate }}{% endif %}
let final = {}
    walkObject = (obj, ref = { ...final }, saveAsArray = false) => {
      let parsedValues = ref
      const keys = Object.keys(obj)
      keys.forEach(key => {
        const isArr = !isNaN(key)
        if (!parsedValues[key]) {
          parsedValues[key] = obj[key]
        } else {
          console.log(key, Array.isArray(ref[key]), saveAsArray)
          if (typeof obj[key] === 'object') {
            if (Array.isArray(ref[key])) {
              parsedValues[key] = walkObject(obj[key], [ ...parsedValues[key] ], true)
            } else {
              parsedValues[key] = walkObject(obj[key], { ...parsedValues[key] })
            }
          } else {
            if (isArr) {
              // parsedValues[key] = [ ...parsedValues[key], ...obj[key] ]
            } else {
              parsedValues[key] = { ...parsedValues[key], ...obj[key] }
            }
          }
        }
      })
      return parsedValues
    }

    Object.keys(req.body).forEach(incomingValue => {
      const splitted = incomingValue.split('___')
      let active = {}
      splitted.reverse().forEach((split, index) => {
        if (index === 0) active[split] = req.body[incomingValue]
        else {
          if (isNaN(split)) {
            active = { [split]: active }
          } else {
            const theIndex = split
            let tempactive = []
            tempactive[theIndex] = active
            active = tempactive
          }
        }
      })
      final = walkObject(active)
    })

    if (req.files) Object.keys(req.files).forEach(incomingValue => {
      const splitted = incomingValue.split('___')
      let active = {}
      splitted.reverse().forEach((split, index) => {
        if (index === 0) active[split] = req.files[incomingValue]
        else {
          if (isNaN(split)) {
            active = { [split]: active }
          } else {
            const theIndex = split
            let tempactive = []
            tempactive[theIndex] = active
            active = tempactive
          }
        }
      })
      final = walkObject(active)
    })

    req.body = final
    {{ table.name | friendly | lower }}
      .createAsPromise({ req, res })
      .then((result) => {
        res.send(result)
      })
      .catch((e) => {
        res.status(e.code || 500).send(e)
      })