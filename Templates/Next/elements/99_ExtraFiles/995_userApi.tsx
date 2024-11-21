/*
path: 995_userApi.tsx
keyPath: elements/99_ExtraFiles/995_userApi.tsx
unique_id: iB9N9QTq
*/
import { auths, database } from '@api-lib/middlewares'
import { ncOpts } from '@api-lib/nc'
import nc from 'next-connect'

const handler = nc(ncOpts)

handler.use(database, ...auths)

handler.get(async (req, res) => {
  if (!req.user) return res.json({ user: null })
  return res.json({ user: req.user })
})

export default handler
