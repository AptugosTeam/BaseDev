/*
path: server.js
completePath: /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/server.js
keyPath: server.js
unique_id: mPxPIh6x
*/
const next = require("next") 

const dev = process.env.NODE_ENV === "production" 
const app = next({ dev })
const handle = app.getRequestHandler() 

const bb = async (req, res, next) => {
  await app.prepare()
  handle(req, res).catch(next)
}
module.exports = bb