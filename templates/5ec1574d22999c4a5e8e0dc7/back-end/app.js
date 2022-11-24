/*
path: app.js
completePath: back-end/app.js
unique_id: 76kg0duo
children: []
*/
const dotenv = require('dotenv')
dotenv.config({ path: './config/.env.development' })

const express = require('express')
const bodyParser = require('body-parser')
const fileupload = require('express-fileupload')

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

{{ insert_setting('ServerAddenum') | raw }}

const dbConfig = require('./config/database.config.js')
const mongoose = require('mongoose')

mongoose.Promise = global.Promise

// Connecting to the database
mongoose.connect(dbConfig.url, {
  useNewUrlParser: true
}).then(() => {
  console.log("Successfully connected to the database")  
}).catch(err => {
  console.log('Could not connect to the database. Exiting now...', err)
  // process.exit();
})

{% for table in application.tables %}
require('./app/routes/{{ table.name | friendly | lower }}.routes.js')(app)
{% endfor %}

{{ insert_setting('ServerRoute') | raw }}

app.use('/images', express.static({% if imagesfolder %}"{{ imagesfolder }}"{% else %}__dirname + '/../dist/img'{% endif %}))

module.exports = app
