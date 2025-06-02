Parameters.unique_id = aptugo.generateID();
Parameters.fields = [];
Parameters.Name = aptugo.friendly(Parameters.Name).toLowerCase();

console.log('IM IMPORT IMAGE AND THIS IS THE APP', Application)
for (var file of Parameters.uploadFiles) {
  let newAsset = {
    type: 'image',
    id: Parameters.id || aptugo.generateID(),
    name: file.name
  }

  const buffer = Buffer.from(new Uint8Array(file.contents))

  aptugo.writeFile(aptugo.join(aptugo.apps._getAppDropsFolder(Parameters.app),`${newAsset.id}_${file.name}`), buffer, { pretify: false })

  if (!Application.assets) Application.assets = []
  Application.assets.push(newAsset)
}

console.log('I WAS IMPORT IMAGE AND THIS IS THE APP', Application)
return Application
