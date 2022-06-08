console.error('creating asset', Parameters)

let newAsset = {
  type: Parameters.type,
  id: aptugo.generateID(),
  name: Parameters.name
}

aptugo.run({ _: ['assets', 'setfile'], binary: true, app: Application._id, filename: newAsset.name, id: newAsset.id }, { file: aptugo.readFile(Parameters.path) })

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