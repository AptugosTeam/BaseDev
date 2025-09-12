return [{
  name: 'Upload Front-End',
  folders: ['build'],
  ignoreFolders: ['node_modules'],
  url: parameters.settings.url.substring(8).toLowerCase(),
  uploadURL: '/api/apps/upload?type=fe'
  // uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?type=fe'
}, {
  name: 'Process Files for Front-End',
  folders: ['.'],
  ignoreFolders: ['node_modules', '.next'],
  url: parameters.settings.url.substring(8).toLowerCase(),
  pipeURL: '/api/apps/upload?after=pnpm%20install%20%26%26%20pnpm%20build'
  // pipeURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?after=pnpm%20install%20%26%26%20pnpm%20run%20build'
}, {
  name: 'Upload Back-End',
  folders: ['back-end'],
  useapi: true,
  ignoreFolders: ['node_modules'],
  url: parameters.settings.apiURL.substring(8).toLowerCase(),
  uploadURL: '/api/apps/upload?type=be'
  // uploadURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?type=fe'
}, {
  name: 'Process Files',
  folders: ['.'],
  useapi: true,
  ignoreFolders: ['node_modules', '.next'],
  url: parameters.settings.apiURL.substring(8).toLowerCase(),
  pipeURL: '/api/apps/upload?after=pnpm%20install%20%26%26%20pnpm%20run%20build'
  // pipeURL: 'https://appcontroller.next.aptugo.app/api/apps/upload?after=pnpm%20install%20%26%26%20pnpm%20run%20build'
}]
