const deploy = (parameters) => {
  return [{
    folders: ['.'],
    ignoreFolders: ['node_modules'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?type=fe'
    // uploadURL: 'http://localhost:8012/api/apps/upload?type=fe'
  }]
}
module.exports = deploy
