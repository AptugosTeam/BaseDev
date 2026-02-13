/*
path: archive.tpl
keyPath: elements/Experimental/Zip/archive.tpl
unique_id: AWgac97t
options:
  - name: fileName
    display: Output File Name
    helpText: Defines the name of the file to be generated
    type: text
    settings:
      default: 'archive.zip'
  - name: files
    display: Files to Compress
    helpText: Array of files to compress, either Array of string with filenames or Array of [source,destination]
    type: text
    settings:
      default: 'archive.zip'
settings:
  - name: BackendPackages
    value: '"archiver": "7.0.1",'
*/
return new Promise((resolve, reject) => {
  const fsArchiver = require('fs')
  const archiver = require('archiver')
  
  const output = fsArchiver.createWriteStream({{ element.values.fileName | default('archive.zip') | textOrVariableInCode }})
  const archive = archiver('zip', { zlib: { level: 9 } })
  
  output.on('close', function() {
    resolve()
  })
  
  output.on('end', function() {
    console.log('Data has been drained');
  })
  
  archive.on('warning', function(err) {
    if (err.code === 'ENOENT') {
      // log warning
    } else {
      reject(err)
    }
  })
  
  archive.on('error', reject)
  
  archive.pipe(output);

  {{ element.values.files }}.forEach(file => {
    if (typeof file === 'string') {
      archive.file(file)
    } else {
      archive.file(file[0], { name: file[1] })
    }
  })
  
  archive.finalize()
})
