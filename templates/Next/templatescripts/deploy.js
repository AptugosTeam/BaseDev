
  return [{
    name: 'Upload Files',
    folders: ['.'],
    ignoreFolders: ['node_modules','.next'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    uploadURL: '/api/apps/upload?type=fe'
    // uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?type=fe'
  },{
    name: 'Process Files',
    folders: ['.'],
    ignoreFolders: ['node_modules','.next'],
    url: parameters.settings.url.substring(8).toLowerCase(),
    pipeURL: '/api/apps/upload?after=pnpm%20install%20%26%26%20pnpm%20run%20build'
    // pipeURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?after=pnpm%20install%20%26%26%20pnpm%20run%20build'
  }]
