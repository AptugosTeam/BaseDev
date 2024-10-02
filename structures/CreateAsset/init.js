let newAsset = {
  type: (Parameters.type == "nothing") ? "other" : Parameters.type,
  id: aptugo.generateID(),
  name: Parameters.name
}

let file = '// Asset created by Aptugo'
if (!Parameters.empty && Parameters.path) {
  file = aptugo.readFile(Parameters.path)
} else if (Parameters.file) {
  file = Parameters.file
}

const parms = { _: ['assets', 'setfile'], binary: true, app: Application._id, filename: newAsset.name, id: newAsset.id }
if (Parameters.state.writeFolder) {
  parms.auth = Parameters.state.writeFolder
}
aptugo.run(parms, { file: file })
Application.assets.push(newAsset)

// Store [Object: null prototype] {
//   folders: {
//     applications: 

// const fileSource = aptugo.readFile(Parameters.path)
// if (fileSource) {
//   if ( window && window.sendAptugoCommand ) {
//     window.sendAptugoCommand({
//       section: 'assets',
//       command: 'setfile',
//       options: `--app ${Application.settings.name} --id '${newAsset._id}' --filename '${newAsset.name}'`,
//       file: fileSource
//     }).then(res => {
//       console.log('Asset created')
//     })
//   }
// }

return Application