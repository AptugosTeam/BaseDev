/*
path: memCache.service.js
completePath: back-end/app/services/memCache.service.js
unique_id: LknM5IrR
*/
const hash = require('node_hash')
const fs = require('fs')

module.exports = class memCache {
  getMemCache(url, timeout) {
    const file = hash.md5(url)
    const filePath = `${__dirname}/cache/${file}`

    if (fs.existsSync(filePath)) {
      const stats = fs.statSync(filePath)
      const minutes = (new Date().getTime() - stats.mtime.getTime()) / 1000 / 60

      if (minutes > timeout) {
        return null
      } else {
        return fs.readFileSync(filePath)
      }
    } else {
      return null
    }
  }

  save(url, contents, binary = false) {
    const file = hash.md5(url)
    const dirPath = `${__dirname}/cache/`

    if (!fs.existsSync(dirPath)) {
      fs.mkdirSync(dirPath)
    }

    const filePath = `${dirPath}${file}`
    if (!binary) {
      fs.writeFileSync(filePath, JSON.stringify(contents), { flag: 'w' })
    } else {
      fs.writeFileSync(filePath, contents, { flag: 'w' })
    }
  }

  reset(url) {
    const file = hash.md5(url)
    const filePath = `${__dirname}/cache/${file}`

    if (fs.existsSync(filePath)) {
      fs.unlinkSync(filePath)
      console.log(`Cache file ${filePath} eliminado.`)
    } else {
      console.warn(`Cache file ${filePath} no existe.`)
    }
  }
}
