/*
path: parseBody.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/src/api-lib/middlewares/parseBody.tsx
keyPath: src/api-lib/middlewares/parseBody.tsx
unique_id: UVJd8Kuq
*/
export async function parseBody(req, res, next) {
  if (req.headers["content-type"] === "application/json") {
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
    console.log( req.headers["content-type"] )
    if (req.file) {
      res.json({ filename: req.file.filename })
      next(false)
    }
  } else {
    next()
  }
}
