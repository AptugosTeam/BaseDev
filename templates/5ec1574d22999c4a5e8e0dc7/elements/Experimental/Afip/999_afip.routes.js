/*
path: 999_afip.routes.js
completePath: >-
  /Users/robrondon/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/Afip/999_afip.routes.js
keyPath: elements/Experimental/Afip/999_afip.routes.js
unique_id: nsTiFATz
*/
module.exports = (app) => {
  const afipServices = require('../services/afip.service.js')

  // Check server status
  app.get('/api/afip/estado-server', async (req, res) => {
    try {
      const serverStatus = await afipServices.getServerStatus();
      res.send(serverStatus);
    } catch (error) {
      console.error(`Error in /api/afip/estado-server: ${error.message}`);
      const errorMessage = error.message || 'Internal Server Error';
      res.status(500).json({ error: errorMessage });
    }
  })

  //Get sales points
  app.get('/api/afip/puntos-venta', async (req, res) => {
    try {
      const result = await afipServices.getSalesPoints()
      res.send(result)
    } catch (error) {
      console.error(`Error in /api/afip/puntos-venta: ${error.message}`);
      const errorMessage = error.message || 'Internal Server Error';
      res.status(500).json({ error: errorMessage });
    }
  })

  // Create a new voucher
  app.post('/api/afip/crear-factura', async (req, res) => {
    try {
      const result = await afipServices.createVoucher({ req })
      res.status(201).json({
        success: true,
        data: result,
        message: 'Bill created successfully.',
      })
    } catch (error) {
      console.error('Error creating bill in /api/afip/crear-factura:', error);
      const errorMessage = error.message || 'Internal Server Error';
      res.status(500).json({
        success: false,
        error: errorMessage,
      });
    }
  })

}