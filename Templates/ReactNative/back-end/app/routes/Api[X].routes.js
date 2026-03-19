/*
path: "{{ table.name |\_friendly |\_lower }}.routes.js"
type: file
unique_id: qLpvzgbk
icon: ico-field
modelRelated: true
subtype: Api
sourceType: javascript
settings:
  - name: Packages
    value: '"node-hash": "latest",'
children: []
*/
const axios = require('axios')
const hash = require('node_hash')
const fs = require('fs')

class memCache {
  getMemCache(url) {
    const file = hash.md5(url)
    if (fs.existsSync(__dirname + '/cache/' + file)) {
      return JSON.parse(fs.readFileSync(__dirname + '/cache/' + file))
    } else {
      return null
    }
    
  }

  save(url, contents) {
    const file = hash.md5(url)
    if (!fs.existsSync(__dirname + '/cache/')) {
      fs.mkdirSync(__dirname + '/cache')
    }
    fs.writeFileSync(__dirname + '/cache/' + file, JSON.stringify(contents), {flag:'w'} )
  }
}

const paginate = (docs, options = {}) => {
  if (!options.page) options.page = 1
  if (!options.limit) options.limit = 10

  const fromDoc = (options.page - 1) * 10
  const toDoc = fromDoc + options.limit
  return {
    docs: docs.slice(fromDoc, toDoc),
    hasNextPage: docs.length > toDoc,
    hasPrevPage: options.page > 1,
    limit: options.limit,
    nextPage: options.page + 1,
    page: options.page,
    pagingCounter: 1,
    prevPage: options.page > 1 ? options.page + 1 : null,
    totalDocs: docs.length,
    totalPages: Math.ceil(docs.length / options.limit)
  }
}

module.exports = (app) => {
  app.get('/api/{{ table.name | friendly | lower }}', async (req, res, next) => {
    const mc = new memCache()
    const url = '{{ table.source }}'
    
    var data = mc.getMemCache(url)
    if (!data) {
      var axiosdata = await axios.get(url)
      data = axiosdata.{{ table.pathtodata }}
      mc.save(url, data)
    }
    res.json(paginate(data, { page: req.query.page || 1 }))
  })
  
  // Perform a search
  app.get('/api/{{ table.name | friendly | lower }}/search/:searchstring', async (req, res) => {
    const mc = new memCache()
    const url = '{{ table.source }}'
    var data = mc.getMemCache(url)
    if (!data) {
      var axiosdata = await axios.get(url)
      data = axiosdata.{{ table.pathtodata }}
      mc.save(url, data)
    }
    
    if (req.query.field) {
      data = data.filter(item => item[req.query.field] === req.params.searchstring)
    }
    
    res.json(paginate(data, { page: req.query.page || 1 }))
  })
}
