/*
path: database.config.js
completePath: back-end/config/database.config.js
unique_id: cTdff9kS
*/
// Database connection string
const dotenv = require('dotenv')
dotenv.config({ path: `${__dirname}/config/.env.development` })

module.exports = {
  url: `${process.env.MONGO_URL}`
}
