/*
path: parseBodyMiddleware.js
keyPath: src/lib/parseBodyMiddleware.js
unique_id: 8tOtBzAo
*/

const parseBodyMiddleware = (req, res, next) => {
  if (req.body) {
    for (const field of Object.keys(req.body)) {
      try {
        req.body[field] = JSON.parse(req.body[field])
      } catch {}
    }
  }

  if (req.files) for (const file of req.files) req.body[file.fieldname] = file.filename
  
  next()
}

export default parseBodyMiddleware
