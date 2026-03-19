const assetInput =
  typeof Parameters.asset === 'object' && Parameters.asset !== null
    ? Parameters.asset
    : {
        id: Parameters.asset,
        name: Parameters.name,
        path: Parameters.path,
        type:
          Parameters.type === 'stylesheetAsset'
            ? 'stylesheet'
            : Parameters.type === 'imageAsset'
              ? 'image'
              : Parameters.assetType || 'other',
        fileContents: Parameters.fileContents || Parameters.file
      }

let assetId = assetInput.id ? assetInput.id : Parameters.asset
const existing = Application.assets.find((asset) => asset.id === assetId)

let newAsset

if (existing) {
  const foundIndex = Application.assets.findIndex((asset) => asset.id === assetId)

  newAsset = {
    type: assetInput.type || existing.type,
    id: assetId || aptugo.generateID(),
    name: assetInput.name || assetInput.source?.name || existing.name
  }

  Application.assets[foundIndex] = {
    ...existing,
    ...newAsset
  }
} else {
  newAsset = {
    type: assetInput.type,
    id: assetId || aptugo.generateID(),
    name: assetInput.name || assetInput.source?.name
  }

  if (Parameters.type === 'stylesheetAsset') {
    newAsset.type = 'stylesheet'
  } else if (Parameters.type === 'imageAsset') {
    newAsset.type = 'image'
  }

  Application.assets.push(newAsset)
  assetId = newAsset.id
}

const parms = {
  _: ['assets', 'setfile'],
  binary: false,
  app: Application._id,
  id: assetId,
  details: newAsset
}

if (Parameters.state?.writeFolder) {
  parms.auth = Parameters.state.writeFolder
}

if (assetInput.fileContents) {
  aptugo.run(parms, { file: JSON.stringify(assetInput.fileContents) })
}

return Application