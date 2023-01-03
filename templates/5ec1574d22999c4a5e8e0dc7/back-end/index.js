/*
path: index.js
completePath: back-end/index.js
unique_id: QOxu9q3o
children: []
*/
const dotenv = require('dotenv')
dotenv.config({ path: './config/.env.development' })
const fs = require('fs')
const express = require('express')
const bodyParser = require('body-parser')
const fileupload = require('express-fileupload')
{% if settings.apiURL|slice(0,5) == 'https' %}
const https = require('https')
{% endif %}
const app = express()
{% set imagesfolder = insert_setting('imagesFolder') %}
{% if imagesfolder %}app.set('filesFolder', "{{ imagesfolder }}" ){% else %}app.set('filesFolder',__dirname + '/../dist/img'){% endif %}

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, XMLHttpRequest, authorization, *")
  res.header("Access-Control-Allow-Methods", "*")
  next()
})

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json({ limit: '10mb' }))
app.use( fileupload() )
app.all('*', checkReq);
function checkReq(req, res, next) {
  if (req.files) {
    const keys = Object.keys(req.files)
    keys.forEach(key => {
      const regex = /(.*)\[([0-9]*)\]/gm;
      let m = regex.exec(key)
      if (m) {
        if (m[2] === '0') {
          req.body[m[1]] = []
          req.files[m[1]] = []
        }
        req.body[m[1]].push(req.files[key])
        req.files[m[1]].push(req.files[key])
        delete req.files[key]
      }
    })
  }
  next();
}

{{ insert_setting('ServerAddenum') | raw }}

const dbConfig = require('./config/database.config.js')
const mongoose = require('mongoose')

mongoose.Promise = global.Promise

// Connecting to the database
mongoose.set('strictQuery', false);
mongoose.connect(dbConfig.url, {
  useNewUrlParser: true,
  useUnifiedTopology: true
}).then(() => {
  console.log("Successfully connected to the database")  
}).catch(err => {
  console.log('Could not connect to the database. Exiting now...', err)
  // process.exit();
})

require('./app/routes/apiRoutes.js')(app)
{% for table in application.tables %}
require('./app/routes/{{ table.name | friendly | lower }}.routes.js')(app)
{% endfor %}

{{ insert_setting('ServerRoute') | raw }}

app.use('/images', express.static({% if imagesfolder %}"{{ imagesfolder }}"{% else %}__dirname + '/../dist/img'{% endif %}))

let tries = 0

function doListen() {
  const port = {{ insert_setting('port')|default('4567') }}
  {% if settings.apiURL|slice(0,5) == 'https' and insert_setting('key') %}
  const server = https.createServer({
    key: fs.readFileSync({{ insert_setting('key') }}, 'utf8'),
    cert: fs.readFileSync({{ insert_setting('cert') }}, 'utf8'),
    ca: fs.readFileSync({{ insert_setting('ca') }}, 'utf8')
    }, app)
  {% else %}
    const server = app
  {% endif %}
    .listen(port,'0.0.0.0')
    .on('listening', () => {
      console.log(`Aptugo app listening on port ${port}!`)
    })
    .on('error', (err) => {
      if (err.errno === 'EADDRINUSE') {
        if (tries < 3) {
          console.log('Port busy, waiting a couple of seconds...')
          tries++
          setTimeout(doListen, 2000)
        } else {
          console.log('Tired of waiting, will kill the process...')
          exec(`kill -9 $(lsof -t -i:${port})`)
          setTimeout(doListen, 2000)
        }
        
      } else {
        console.log(err)
      }
    })
    .on('connection', (conn) => {
      console.log('connection')
    })
    {{ insert_setting('ServerAddenumAfterUp') | raw }}
}

doListen()




