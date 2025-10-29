const deploy = (parameters) => {
  return [{
    name: 'Upload Front-End',
    folders: ['build'],
    ignoreFolders: ['node_modules'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?process=true&chunkName=tempfile.bin.part1&type=fe'
  },
  {
    name: 'Upload Back-End',
    folders: ['back-end'],
    useapi: true,
    ignoreFolders: ['node_modules'],
    url: parameters.settings.apiURL.substring(8).toLowerCase(),
    uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?process=true&chunkName=tempfileback.bin.part1&type=be'
  }]
}

module.exports = deploy