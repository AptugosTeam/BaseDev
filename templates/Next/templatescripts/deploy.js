
  return [{
    name: 'Upload Files',
    folders: ['.'],
    ignoreFolders: ['node_modules','.next'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?type=fe'
  },{
    name: 'Process Files',
    folders: ['.'],
    ignoreFolders: ['node_modules','.next'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    pipeURL: 'https://appcontroller.next.aptugo.app/api/apps/upload'
  }]
