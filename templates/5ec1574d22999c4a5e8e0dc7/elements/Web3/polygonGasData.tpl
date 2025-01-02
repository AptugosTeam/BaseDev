/*
path: polygonGasData.tpl
keyPath: elements/Web3/polygonGasData.tpl
unique_id: MPxG4sno
*/

const getPolygonGasStationData = async () => {
  try {
    const response = await axios.get('https://gasstation.polygon.technology/v2')
    const gasData = response.data

    console.log('Polygon Gas Station Response:', gasData)

    const { estimatedBaseFee } = gasData
    const { maxPriorityFee, maxFee } = gasData.fast

    return {
      estimatedBaseFee,
      maxPriorityFee,
      maxFee,
    }
  } catch (error) {
    console.error('Error in getPolygonGasStationData:', error)
    throw error
  }
}