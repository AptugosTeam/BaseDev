/*
path: parseBody.tsx
keyPath: src/api-lib/middlewares/parseBody.tsx
unique_id: UVJd8Kuq
*/
import { randomUUID } from 'crypto'
import path from 'path'

function addToBody(body, key, value) {


  if (typeof body[key] === 'undefined') {
    body[key] = value
  } else if (Array.isArray(body[key])) {
    body[key].push(value)
  } else {
    body[key] = [body[key], value]
  }
}

function parseContentDisposition(value = '') {
  const out: any = {}
  const parts = value.split(';').map((p) => p.trim())

  out.type = parts[0] || ''

  for (const part of parts.slice(1)) {
    const eq = part.indexOf('=')
    if (eq === -1) continue
    const k = part.slice(0, eq).trim()
    let v = part.slice(eq + 1).trim()
    if (v.startsWith('"') && v.endsWith('"')) v = v.slice(1, -1)
    out[k] = v
  }

  return out
}

function parseMultipart(buffer, boundary) {
  const result = { body: {}, files: [] }
  const boundaryBuffer = Buffer.from(`--${boundary}`)
  const parts = []

  let start = buffer.indexOf(boundaryBuffer)
  while (start !== -1) {
    const next = buffer.indexOf(boundaryBuffer, start + boundaryBuffer.length)
    if (next === -1) break

    let part = buffer.slice(start + boundaryBuffer.length, next)

    // Trim leading CRLF
    if (part[0] === 13 && part[1] === 10) part = part.slice(2)

    // Ignore final boundary marker section
    if (part.length >= 2 && part[0] === 45 && part[1] === 45) break

    // Trim trailing CRLF
    if (part.length >= 2 && part[part.length - 2] === 13 && part[part.length - 1] === 10) {
      part = part.slice(0, -2)
    }

    parts.push(part)
    start = next
  }

  for (const part of parts) {
    const headerEnd = part.indexOf(Buffer.from('\r\n\r\n'))
    if (headerEnd === -1) continue

    const rawHeaders = part.slice(0, headerEnd).toString('utf8')
    const content = part.slice(headerEnd + 4)

    const headers = {}
    for (const line of rawHeaders.split('\r\n')) {
      const idx = line.indexOf(':')
      if (idx === -1) continue
      const key = line.slice(0, idx).trim().toLowerCase()
      const value = line.slice(idx + 1).trim()
      headers[key] = value
    }

    const disposition = parseContentDisposition(headers['content-disposition'] || '')
    const fieldName = disposition.name
    const fileName = disposition.filename

    if (!fieldName) continue

    if (typeof fileName !== 'undefined' && fileName !== '') {
      const mimeType = headers['content-type'] || 'application/octet-stream'
      const ext = path.extname(fileName)
      const safeName = `${Date.now()}_${randomUUID()}${ext}`

      result.files.push({
        fieldname: fieldName,
        originalname: fileName,
        mimetype: mimeType,
        size: content.length,
        buffer: content,
        filename: safeName,
      })

      // Also reflect something in req.body for the file field
      addToBody(result.body, fieldName, fileName)
    } else {
      addToBody(result.body, fieldName, content.toString('utf8'))
    }
  }

  return result
}

export async function parseBody(req, res, next) {
  const prepareNext = () => {
    if (req.body) { 
      for (const field of Object.keys(req.body)) { 
        try {
          req.body[field] = JSON.parse(req.body[field])
        } catch {} 
      }
    }
  }
  if (req.method === 'OPTIONS') {
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, OPTIONS')
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization')
    return res.status(200).send('ok')
  }

  res.setHeader('Access-Control-Allow-Origin', '*')
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, OPTIONS')
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization')

  const contentType = req.headers['content-type'] || ''

  let chunks = []

  req.on('data', (chunk) => {
    chunks.push(Buffer.isBuffer(chunk) ? chunk : Buffer.from(chunk))
  })

  req.on('end', () => {
    try {
      const raw = Buffer.concat(chunks)
      req.body = {}
      req.files = []

      if (!raw.length) {
        prepareNext()
        return next()
      }

      if (contentType.includes('application/json')) {
        req.body = JSON.parse(raw.toString('utf8') || '{}')
        return next()
      }

      if (contentType.includes('application/x-www-form-urlencoded')) {
        const params = new URLSearchParams(raw.toString('utf8'))
        for (const [key, value] of params.entries()) {
          addToBody(req.body, key, value)
        }
        prepareNext()
        return next()
      }

      if (contentType.includes('multipart/form-data')) {
        const boundaryMatch = contentType.match(/boundary=(?:"([^"]+)"|([^;]+))/i)
        const boundary = boundaryMatch?.[1] || boundaryMatch?.[2]

        if (!boundary) {
          return res.status(400).json({ error: 'Missing multipart boundary' })
        }

        const parsed = parseMultipart(raw, boundary)
        req.body = parsed.body
        req.files = parsed.files

        prepareNext()
        return next()
      }

      // fallback for plain text or unknown
      req.body.raw = raw.toString('utf8')
      prepareNext()
      return next()
    } catch (e) {
      console.error('Invalid body:', e.message)
      return res.status(400).json({ error: 'Invalid request body' })
    }
  })

  req.on('error', (err) => {
    console.error('Error reading request body:', err.message)
    return res.status(500).json({ error: 'Error reading request body' })
  })
}
