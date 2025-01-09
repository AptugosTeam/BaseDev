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

  if (req.headers["content-type"] === "application/json") {
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization')

    const readable = req.read()
    const buffer = await Buffer.from(readable)
    try {
      const data = JSON.parse(buffer.toString());
      req.body = data
      next()
    } catch (e) {
      return res.status(400).end();
    }
  } else if (req.file) {
    if (req.file) {
      res.json({ filename: req.file.filename })
      next(false)
    }
  } else {
    next()
  }
}
