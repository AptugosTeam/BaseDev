/*
path: server.js
keyPath: server.js
unique_id: mPxPIh6x
*/
const next = require("next") 

const app = next({
  dir: '/var/www/wildcards/{{ settings.url | replace({"http://": "", "https://": ""}) }}',
  dev: false,
})

const handle = app.getRequestHandler()

let prepared

module.exports = async function handler(req, res, nextMiddleware) {
  try {
    if (!prepared) prepared = app.prepare()
    await prepared
    await handle(req, res)
  } catch (e) {
    nextMiddleware(e)
  }
}