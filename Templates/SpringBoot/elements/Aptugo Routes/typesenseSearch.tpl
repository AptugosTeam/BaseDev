/*
path: typesenseSearch.tpl
type: file
unique_id: muRzEH87
icon: ico-field
children: []
settings:
  - name: Packages
    value: '"typesense": "latest",'
*/
// ts search
    const Typesense = require('typesense')
  const Elements = require('../models/elements.model.js')
  let client = new Typesense.Client({
    'nodes': [{
      'host': '127.0.0.1', // For Typesense Cloud use xxx.a1.typesense.net
      'port': '8108',      // For Typesense Cloud use 443
      'protocol': 'http'   // For Typesense Cloud use https
    }],
    'apiKey': 'wfEpVn4Grq6FBXsXlYG190N6M3CHhPD6DqGuPo4nTEx8NBeL',
    'connectionTimeoutSeconds': 2
  })

  const ElementsSchema = {
    name: 'elements',
    fields: [{
      name: 'Name',
      type: 'string'
    },{
      name: 'Abstract',
      type: 'string'
    },{
      name: 'Description',
      type: 'string'
    }]
  }

if (req.query.q === 'fillitup') {
  try {
    client.collections().create(ElementsSchema)

    elements.find({ query: { limit: 500000 } }).then(res => {
      res.docs.forEach(doc => {
        const elDoc = {
          Name: doc.Name,
          Abstract: doc.Abstract,
          Description: doc.Description
        }
        client.collections('elements').documents().create(elDoc)
      })
    })
  } catch(e) {}
}
  


  let searchParameters = {
    'q'         : req.query.q,
    'query_by'  : 'Name'
  }
  
  client.collections('elements')
    .documents()
    .search(searchParameters)
    .then(function (searchResults) {
      res.send(searchResults)
    })
  // 
