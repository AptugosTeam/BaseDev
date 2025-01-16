/*
path: parseBody.tsx
keyPath: src/api-lib/middlewares/parseBody.tsx
unique_id: UVJd8Kuq
*/
export async function parseBody(req, res, next) {
  if (req.method === 'OPTIONS') {
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization')
    res.status(200).send('ok')
    return
  }

  if (req.headers['content-type'] === 'application/json') {
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization')

    let body = ''
    req.on('data', (chunk) => {
      body += chunk
    })

    req.on('end', () => {
      try {
        req.body = JSON.parse(body)
        next()
      } catch (e) {
        console.error('Invalid JSON:', e.message)
        res.status(400).send({ error: 'Invalid JSON' })
      }
    })

    req.on('error', (err) => {
      console.error('Error reading request body:', err.message)
      res.status(500).send({ error: 'Error reading request body' })
    })
  } else if (req.file) {
    res.json({ filename: req.file.filename })
    next(false)
  } else {
    next()
  }
}