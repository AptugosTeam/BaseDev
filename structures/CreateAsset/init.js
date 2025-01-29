let newAsset = {
  type: Parameters.type,
  id: Parameters.id || aptugo.generateID(),
  name: Parameters.name
}

let file = '// Asset created by Aptugo'
if (!Parameters.empty && Parameters.path) {
  file = aptugo.readFile(Parameters.path)
} else if (Parameters.file) {
  file = Parameters.file
}

const buffer = Buffer.from(new Uint8Array(file))
aptugo.writeFile(aptugo.join(aptugo.apps._getAppDropsFolder(Parameters.app),`${newAsset.id}_${Parameters.path}`), buffer, { pretify: false })

if (!Application.assets) Application.assets = []
Application.assets.push(newAsset)

return Application