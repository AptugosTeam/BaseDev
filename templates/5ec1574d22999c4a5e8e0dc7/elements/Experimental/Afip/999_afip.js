/*
path: 999_afip.js
completePath: >-
  /Users/robrondon/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/Afip/999_afip.js
keyPath: elements/Experimental/Afip/999_afip.js
unique_id: w2mTGPez
*/
const Afip = require('@afipsdk/afip.js');

const production = {{ insert_setting('Production') | default(false) }}

const options = {
  CUIT: {{ insert_setting('ClientCuit') | default(11111111) }},
  cert: './cert.crt',
  key: './key.key',
  ta_folder: './',
  res_folder: './',

}

if (production) options.production = true


const afip = new Afip(options);


const getServerStatus = async (options) => {
  return 'How you doin?'
  // return await afip.ElectronicBilling.getServerStatus();
}

const getSalesPoints = async (options) => {
  return `I'm a sale point`
}

const createVoucher = async (options) => {
  console.log(options)
  return 'Creando una factura'
}

module.exports = {
  getServerStatus,
  getSalesPoints,
  createVoucher
}