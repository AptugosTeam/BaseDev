/*
path: server.js
keyPath: server.js
unique_id: mPxPIh6x
*/
const next = require("next") 

const app = next({ 
  dir: '/var/www/wildcards/{{ settings.url | replace({"http://": "", "https://": ""}) }}'
})
const handle = app.getRequestHandler() 

const bb = async (req, res, next) => {
  try {
    await app.prepare()
    await handle(req, res)
  } catch(e) {
    next(e)
  }
}
module.exports = bb