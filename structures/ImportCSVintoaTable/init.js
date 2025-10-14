String.prototype.csvToArray = function (o) {
  var od = {
    fSep: ',',
    rSep: '\r\n',
    quot: '"',
    head: false,
    trim: false,
  };
  if (o) {
    for (var i in od) {
      if (!o[i]) o[i] = od[i];
    }
  } else {
    o = od;
  }
  var a = [['']];
  for (var r = (f = p = q = 0); p < this.length; p++) {
    switch ((c = this.charAt(p))) {
      case o.quot:
        if (q && this.charAt(p + 1) == o.quot) {
          a[r][f] += o.quot;
          ++p;
        } else {
          q ^= 1;
        }
        break;
      case o.fSep:
        if (!q) {
          if (o.trim) {
            a[r][f] = a[r][f].replace(/^\s\s*/, '').replace(/\s\s*$/, '');
          }
          a[r][++f] = '';
        } else {
          a[r][f] += c;
        }
        break;
      case o.rSep.charAt(0):
        if (
          !q &&
          (!o.rSep.charAt(1) ||
            (o.rSep.charAt(1) && o.rSep.charAt(1) == this.charAt(p + 1)))
        ) {
          if (o.trim) {
            a[r][f] = a[r][f].replace(/^\s\s*/, '').replace(/\s\s*$/, '');
          }
          a[++r] = [''];
          a[r][(f = 0)] = '';
          if (o.rSep.charAt(1)) {
            ++p;
          }
        } else {
          a[r][f] += c;
        }
        break;
      default:
        a[r][f] += c;
    }
  }
  if (o.head) {
    a.shift();
  }
  if (a[a.length - 1].length < a[0].length) {
    a.pop();
  }
  return a;
}

const untitledTables = Application.tables.filter( (table) => table.name.substr(0, 8) === 'Untitled' ).length

if (!Parameters.Name) {
  Parameters.Name = `Untitled`
  if (untitledTables > 0) Parameters.Name = Parameters.Name + ` (${untitledTables})`
}

Parameters.unique_id = aptugo.generateID()
Parameters.fields = []
Parameters.Name = aptugo.friendly(Parameters.Name).toLowerCase()

for (var file of Parameters.uploadFiles) {
  const buffer = Buffer.from(new Uint8Array(file.contents))
  const contents = buffer.toString()
  
  const singleName = `${Parameters.Name}record`

  var finalFields = []
  var lines = contents.split('\n')
  var headers = lines.shift()
  var fields = headers.split(',')

  var finalData = []
  
  fields.forEach((field) => {
    Parameters.fields.push(aptugo.friendly(field))
  })

  lines.forEach((line) => {
    var linedata = line.csvToArray()[0]
    var finalDataRow = {}
    linedata.forEach((dataCell, index) => {
      finalDataRow[Parameters.fields[index]] = dataCell
    })
    finalData.push(finalDataRow)
  })

  Parameters.csvData = finalData
  
  // Detect data types
  const columnTypes = {}
  for (const field of Parameters.fields) {
    columnTypes[field] = 'Number'
    for (const row of finalData) {
      const value = row[field]
      if (isNaN(parseFloat(value))) {
        columnTypes[field] = 'String'
        break
      } else {
        row[field] = parseFloat(value)
      }
    }
  }  

  fields.forEach((field) => {
    const friendlyField = aptugo.friendly(field)
    finalFields.push({
      column_name: friendlyField,
      data_type: columnTypes[friendlyField],
      unique_id: aptugo.generateID(),
    })
  })

  Application = await aptugo.structures.run('New Table', {
    unique_id: Parameters.unique_id,
    name: Parameters.Name || 'UntitledImport',
    singleName: singleName,
    fields: finalFields,
    state: { ...State, app: Application } } )

  const newTable = Application.tables.find(tlb => tlb.unique_id === Parameters.unique_id)

  Parameters.contents = contents
}

return Application
