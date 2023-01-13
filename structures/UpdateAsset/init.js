let assetId = Parameters.asset.id ? Parameters.asset.id : Parameters.asset
const existing = Application.assets.find(asset => asset.id === assetId)

let newAsset
let _id = null
if (existing) {
    var foundIndex = Application.assets.findIndex(asset => asset.id == assetId)
    Application.assets[foundIndex] = Parameters.asset
    newAsset = {
        type: Parameters.asset.type,
        id: assetId || aptugo.generateID(),
        name: Parameters.asset.name || Parameters.asset.source.name
    }
} else {
    newAsset = {
        type: Parameters.asset.type,
        id: assetId || aptugo.generateID(),
        name: Parameters.asset.name || Parameters.asset.source.name
    }

    if (Parameters.type === 'stylesheetAsset') {
        newAsset.type = 'stylesheet'
    } else if (Parameters.type === "imageAsset") {
        newAsset.type = 'image'
    }

    Application.assets.push(newAsset)
    assetId = newAsset.id
}

console.log(Parameters)
if (Parameters.asset.fileContents) {
    aptugo.run({ _: ['assets', 'setfile'], binary: false, app: Application._id, id: assetId, details: newAsset }, { file: JSON.stringify(Parameters.asset.fileContents) })
    // if ( window.sendAptugoCommand ) {
    //     window.sendAptugoCommand({
    //         section: 'assets',
    //         command: 'setfile',
    //         options: `--app ${Application.settings.name} --id '${assetId}' --filename '${newAsset.name}'`,
    //         file: JSON.stringify(Parameters.asset.fileContents)
    //     }).then(res => {
    //         console.log('Asset created')
    //     })
    // }
}

return Application