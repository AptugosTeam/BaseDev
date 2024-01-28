const deploy = (parameters) => {
  return [{
    folders: ['.next'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    uploadURL: 'https://appuploader.next.aptugo.app:8501/upload?type=fe'
  }]
}
module.exports = deploy
