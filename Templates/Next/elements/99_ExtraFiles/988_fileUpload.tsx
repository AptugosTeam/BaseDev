/*
path: 988_fileUpload.tsx
keyPath: elements/99_ExtraFiles/988_fileUpload.tsx
unique_id: OenclTMc
*/
import { auths, database } from '@api-lib/middlewares'
import { ncOpts } from '../../api-lib/nc'
import nc from 'next-connect'
import multer from 'multer'
import sizeOf from 'image-size'

export const config = {
  api: {
    bodyParser: false,
  },
}

const upload = multer({
  storage: multer.diskStorage({
    filename: (_req, file, callback) => {
      const uniqueFileName = Date.now() + '-' + file.originalname
      callback(null, uniqueFileName)
    },
    destination: (_req, _file, callback) => {
      callback(null, './public/img')
    },
  }),
  limits: {
    fileSize: 5 * 1024 * 1024,
  },
})

const handler = nc(ncOpts)
handler.use(database, ...auths)
handler.use(upload.single('image'))

handler.post(
  (req, res) => {
    const { originalname, buffer } = req.file
    let dimensions
    try {
      dimensions = sizeOf(req.file.path)
    } catch (error) {
      console.error('Error getting image dimensions:', error)
    }

    req.fileInfo = {
      ...req.file,
      dimensions,
    }
    res.json(req.fileInfo)
  }
)

export default handler
