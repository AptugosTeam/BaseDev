/*
path: 992_authMiddleware.tsx
keyPath: elements/Programming/Snippets/extraFiles/992_authMiddleware.tsx
unique_id: Fxxw1Aln
*/
import { passport } from '../auth'
import session from './session'

const auths = [session, passport.initialize(), passport.session()]

export default auths
