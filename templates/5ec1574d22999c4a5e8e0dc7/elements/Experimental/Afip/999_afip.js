/*
path: 999_afip.js
completePath: >-
  /Users/robrondon/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/Afip/999_afip.js
keyPath: elements/Experimental/Afip/999_afip.js
unique_id: w2mTGPez
*/
const Afip = require('@afipsdk/afip.js');
const errors = require('../services/errors.service')

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

/**
 * Retrieve the server status from AFIP Electronic Billing.
 * @async
 * @returns {Object} - Server status information.
 * @throws {Error} - If fetching the server status fails.
 */
const getServerStatus = async () => {
  try {
    const serverStatus = await afip.ElectronicBilling.getServerStatus();
    return serverStatus;
  } catch (error) {
    console.error('Error getting server status:', error);
    const errorMessage = error.message || error;
    throw new Error(`Error fetching server status: ${errorMessage}`);
  }
};

/*
  * No esta funcionando.. se abrio issue en github
  */

/**
 * Retrieve the list of sales points from AFIP Electronic Billing.
 * @async
 * @returns {Array} - Array of sales points.
 * @throws {Error} - If fetching the sales points fails.
 */
const getSalesPoints = async () => {
  try {
    const salesPoints = await afip.ElectronicBilling.getSalesPoints()
    return salesPoints
  } catch (error) {
    console.error('Error getting sales points:', error);
    const errorMessage = error.message || error;
    throw new Error(`Failed to get sales points: ${errorMessage}`)
  }
}

/**
 * Retrieve the last voucher number for a specified selling point and bill type from AFIP Electronic Billing.
 * @async
 * @param {Object} options - Options object containing sellingPoint and billType.
 * @param {number} options.sellingPoint - The selling point for which to retrieve the last voucher.
 * @param {number} options.billType - The bill type for which to retrieve the last voucher.
 * @returns {number} - The last voucher number.
 * @throws {Error} - If fetching the last voucher fails.
 */
const getLastBill = async (options) => {
  try {
    const { sellingPoint, billType } = options
    const lastVoucher = await afip.ElectronicBilling.getLastVoucher(sellingPoint, billType)
    return lastVoucher
  } catch (error) {
    console.error('Error getting last voucher:', error);
    const errorMessage = error.message || error;
    throw new Error(`Failed to get last voucher: ${errorMessage}`)
  }
}

/**
 * Retrieve information for a specific bill (voucher) from AFIP Electronic Billing.
 * @async
 * @param {Object} options - Options object containing billNumber, sellingPoint, and billType.
 * @param {number} options.billNumber - The number of the bill to retrieve information for.
 * @param {number} options.sellingPoint - The selling point associated with the bill.
 * @param {number} options.billType - The type of the bill to retrieve information for.
 * @returns {Object} - Information about the specified bill.
 * @throws {Error} - If fetching the bill information fails.
 */
const getBillInfo = async (options) => {
  try {
    const { billNumber, sellingPoint, billType } = options;
    const billInfo = await afip.ElectronicBilling.getVoucherInfo(
      billNumber,
      sellingPoint,
      billType
    );
    return billInfo;
  } catch (error) {
    console.error('Error getting bill info:', error);
    const errorMessage = error.message || error;
    throw new Error(`Failed to get bill info: ${errorMessage}`)
  }
};

/*
  * Numero del punto de venta (sellingPoint)
    Dependerá del cliente.. puede tener multiples puntos de venta
  * Tipo de factura (billType)
    1 = Factura A
    6 = Factura B
    11 = Factura C
    3 = Nota de Crédito A
    8 = Nota de Crédito B
    13 = Nota de Crédito C
    4 = Recibo A
    9 = Recibo B
    15 = Recibo C
  * Concepto de la factura (billConcept)
    1 = Productos
    2 = Servicios
    3 = Productos y Servicios
  * Tipo de documento del comprador (docType)
    80 = CUIT
    86 = CUIL
    96 = DNI
    99 = Consumidor Final
  * Nro de documento comprador [0 para consumidor final] (docNumber)
  * Cbu (cbu) Requerido para factura de crédito electrónica
  * ID tipos de IVA
    3 = 0%
    4 = 10.5%
    5 = 21%
    6 = 27%
    8 = 5%
    9 = 2.5%
  */

/**
* Create a new voucher and return the corresponding bill information.
* @param {Object} options - Options object containing request data or other relevant information.
* @returns {Object} - Bill information.
* @throws {Error} - If the voucher creation or bill information retrieval fails.
*/
const createVoucher = async (options = {}) => {
  try {
    const data = options.req ? options.req.body : options.data
    const {
      sellingPoint = 1,
      billType = 1,
      billConcept = 1,
      docType = 99,
      docNumber = 0,
      taxedAmount = 0,
      untaxedAmount = 0,
      ivaAmount = 0,
      ivaFreeAmount = 0,
      serviceStartDate = null,
      serviceEndDate = null,
      paymentDueDate = null,
    } = data

    const lastBill = await getLastBill({
      sellingPoint,
      billType
    }
    );

    const billNumber = lastBill + 1

    const date = new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
      .toISOString()
      .split('T')[0];

    const billData = prepareBillData({
      billType,
      billConcept,
      docType,
      docNumber,
      billNumber,
      untaxedAmount,
      taxedAmount,
      ivaFreeAmount,
      ivaAmount,
      date
    })
    /**
     * Obligatorios para los conceptos 2 y 3
     **/

    if (billConcept === 2 || billConcept === 3) {
      /**
       * Fecha de inicio de servicio en formato aaaammdd
       **/
      billData.FchServDesde = serviceStartDate;

      /**
       * Fecha de fin de servicio en formato aaaammdd
       **/
      billData.FchServHasta = serviceEndDate;
      /**
       * Fecha de vencimiento del pago en formato aaaammdd  ESTO NO VA EN FACTURA DE CREDITO ELECTRONICA
       **/
      billData.FchVtoPago = paymentDueDate;
    }

    if (billType !== 11 && billType !== 211) {
      billData.Iva = [
        // Alícuotas asociadas a la factura
        {
          Id: 5, //Id del tipo de IVA (5 para 21%)(ver tipos disponibles)
          BaseImp: taxedAmount, // Base imponible
          Importe: ivaAmount, // Importe
        },
      ];
    }

    const voucher = await afip.ElectronicBilling.createVoucher(billData, true);

    if (voucher) {
      const bill = await getBillInfo({ billNumber, sellingPoint, billType });
      return bill
    }
  } catch (error) {
    console.error('Error creating a new voucher:', error);
    const errorMessage = error.message || error;
    throw new Error(`Failed to create a new voucher: ${errorMessage}`)
  }
}

/**
 * Prepare bill data based on the provided parameters.
 * @param {Object} params - Parameters needed for building bill data.
 * @returns {Object} - Prepared bill data.
 */
const prepareBillData = ({
  billType,
  billConcept,
  docType,
  docNumber,
  billNumber,
  untaxedAmount,
  taxedAmount,
  ivaFreeAmount,
  ivaAmount,
  date
}) => {
  return {
    CantReg: 1, // Cantidad de facturas/comprobantes a registrar
    PtoVta: sellingPoint, // Punto de venta
    CbteTipo: billType, // Tipo de comprobante (ver tipos disponibles)
    Concepto: billConcept, // Concepto del Comprobante: (1)Productos, (2)Servicios, (3)Productos y Servicios
    DocTipo: docType, // Tipo de documento del comprador (99 consumidor final, ver tipos disponibles)
    DocNro: docNumber, // Número de documento del comprador (0 consumidor final)
    CbteDesde: billNumber, // Número de comprobante o numero del primer comprobante en caso de ser mas de uno
    CbteHasta: billNumber, // Número de comprobante o numero del último comprobante en caso de ser mas de uno
    CbteFch: parseInt(date.replace(/-/g, '')), // (Opcional) Fecha del comprobante (yyyymmdd) o fecha actual si es nulo
    ImpTotal: taxedAmount + ivaAmount + ivaFreeAmount, // Importe total del comprobante
    ImpTotConc: untaxedAmount, // Importe neto no gravado
    ImpNeto: taxedAmount, // Importe neto gravado  (Hay que ver este)
    ImpOpEx: ivaFreeAmount, // Importe exento de IVA
    ImpIVA: ivaAmount, //Importe total de IVA
    ImpTrib: 0, //Importe total de tributos
    MonId: 'PES', //Tipo de moneda usada en el comprobante (ver tipos disponibles)('PES' para pesos argentinos)
    MonCotiz: 1, // Cotización de la moneda usada (1 para pesos argentinos),
  }
}


module.exports = {
  createVoucher,
  getBillInfo,
  getLastBill,
  getSalesPoints,
  getServerStatus,
}