/*
path: 002_index.tsx
completePath: >-
  C:\Users\Usuario\Aptugo\BaseDev\Templates\Next\elements\Interact\email\002_index.tsx
keyPath: elements\Interact\email\002_index.tsx
unique_id: AQ0k7mBF
*/
import { sendEmail } from '@api-lib/db/emails'
import { auths, database } from '@api-lib/middlewares'
import { ncOpts } from '@api-lib/nc'
import nc from 'next-connect'

const handler = nc(ncOpts)

handler.use(database, ...auths)

handler.post(async (req, res) => {
    try {
        const { to, subject, text, html, from } = req.body

        if (!to || !subject || !text) {
            return res.status(400).json({ error: 'Required fields are missing' })
        }

        let result
        result = await sendEmail(req.db, { to, subject, text, html, from })

        return res.status(200).json(result)
    } catch (error) {
        console.error('Error sending email:', error)
        return res.status(500).json({ error: 'Error sending email', message: error.message })
    }
})

export default handler