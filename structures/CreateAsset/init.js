let newAsset = {
  type: Parameters.type,
  id: Parameters.id || aptugo.generateID(),
  name: Parameters.name
}

let file = '// Asset created by Aptugo'
if (Parameters.file) {
  file = Parameters.file
} else if (!Parameters.empty && Parameters.path) {
  file = aptugo.readFile(Parameters.path)
}

console.log('saving file contents:', file)

const fileName = `${newAsset.id}_${Parameters.path}`;
const filePath = aptugo.join(aptugo.apps._getAppDropsFolder(Parameters.app), fileName);
console.log('saving file to:', filePath);

// Convert appropriately
let buffer
if (typeof file === 'string') {
  buffer = Buffer.from(file, 'utf-8')
} else {
  buffer = file // Already a buffer
}

aptugo.writeFile(filePath, buffer, { pretify: false })

if (!Application.assets) Application.assets = []
Application.assets.push(newAsset)

return Application