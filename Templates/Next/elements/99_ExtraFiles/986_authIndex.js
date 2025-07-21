/*
path: index.js
keyPath: src/pages/api/auth/index.js
unique_id: ZfwgpkSE
*/
import nextConnect from 'next-connect'
import passport from 'passport'
import { auths, database } from '@api-lib/middlewares'

const handler = nextConnect();

handler.use(database, ...auths)

handler.get(async (req, res, next) => {
  const {
    query: { provider },
    method
  } = req;

  switch (provider) {
    case 'github':
      return passport.authenticate('github')(req, res, next);
    case 'local':
      res.status(200).json({ provider, status: 'local login provided at /api/auth/local with method POST' });
      break;
    default:
      res.status(200).json({ provider, status: 'not enabled' });
      break;
  }
});

handler.post((req, res, next) => {
  return passport.authenticate('local', (err, user) => {
    if (err) {
      return next(err);
    }

    if (!user) {
      return res.status(401).json({
        status: 401,
        failedAuth: true,
        redirectTo: process.env.loginFailureURL,
        errorMessage: 'Username or Password is incorrect'
      });
    }

    req.logIn(user, (err) => {
      if (err) {
        return next(err);
      }

      res.status(200).json({ status: 200, user });
    });
  })(req, res, next)
});

export default handler