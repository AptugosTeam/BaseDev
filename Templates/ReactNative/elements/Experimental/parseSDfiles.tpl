/*
path: parseSDfiles.tpl
type: file
unique_id: pbSAr4BO
icon: ico-chart-choropleth
children: []
settings:
  - name: BackendPackages
    value: '"sdf-parser": "^4.0.2",'
  - name: ServerRoute
    value: >-
      app.set('parseSDF', async function (fileContents) {
        return new Promise((resolve, reject) => {
          var parse = require('sdf-parser')
          var result = parse(fileContents)
          resolve(result)
        })
      })
*/

// App parses SD / SDF files