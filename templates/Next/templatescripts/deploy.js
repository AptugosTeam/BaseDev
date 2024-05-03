const deploy = (parameters) => {
  return [{
    folders: ['.'],
    ignoreFolders: ['node_modules'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    uploadURL: 'https://appuploader.next.aptugo.app/upload?type=fe'
  }]
}
module.exports = deploy
