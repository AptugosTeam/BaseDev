const assetID = Parameters.asset
let file = '// Asset created by Aptugo'

const assetObject = Application.assets.find((asset) => asset.id === assetID)

if (Parameters.file) {
  file = Parameters.file
} else if (!Parameters.empty && Parameters.path) {
  file = aptugo.readFile(Parameters.path)
}

// Convert appropriately
let buffer
if (typeof file === 'string') {
  buffer = Buffer.from(file, 'utf-8')
} else {
  buffer = file // Already a buffer
}

const fileName = `${assetObject.id}_${assetObject.name}`
const filePath = aptugo.join(aptugo.apps._getAppDropsFolder(Parameters.app), fileName)
console.log('saving file to:', filePath)

aptugo.writeFile(filePath, buffer, { pretify: false })

return Application