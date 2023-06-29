/*
path: 999_afip.routes.js
completePath: >-
  /Users/robrondon/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/Afip/999_afip.routes.js
keyPath: elements/Experimental/Afip/999_afip.routes.js
unique_id: nsTiFATz
*/
module.exports = (app) => {
  const afipServices = require('../services/afip.service.js')

  app.get('/api/afip/estado-server', async (req, res) => {
    const result = await afipServices.getServerStatus({req, res})
    res.send(result)
  })
  app.get('/api/afip/puntos-venta', async (req, res) => {
    const result = await afipServices.getSalesPoints({req, res})
    res.send(result)
  })
  app.post('/api/afip/crear-factura', async (req, res) => {
    const result = await afipServices.createVoucher({req, res})
    res.send(result)
  })

}