Parameters.unique_id = aptugo.generateID();
Parameters.fields = [];
Parameters.Name = aptugo.friendly(Parameters.Name).toLowerCase();

for (var file of Parameters.uploadFiles) {
  let newAsset = {
    type: 'stylesheet',
    id: aptugo.generateID(),
    name: file.name
  }

  const buffer = Buffer.from(new Uint8Array(file.contents))
  aptugo.writeFile(aptugo.join(aptugo.apps._getAppDropsFolder(Parameters.app),`${newAsset.id}_${file.name}`), buffer, { pretify: false })

  if (!Application.assets) Application.assets = []
  Application.assets.push(newAsset)
}

return Application
