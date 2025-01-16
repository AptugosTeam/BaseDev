
  return [{
    folders: ['.'],
    ignoreFolders: ['node_modules'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?type=fe'
  }]
