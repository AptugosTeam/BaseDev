
try {
  const tableRef = Parameters.Table
  const action = (Parameters.Action || '').toLowerCase()

  if (!tableRef) return { error: 'Missing parameter: Table' }
  if (!action) return { error: 'Missing parameter: Action' }

  if (!Application.tables || !Array.isArray(Application.tables)) {
    return { error: 'Application has no tables loaded' }
  }

  const findTableIndex = (ref) => {
    return Application.tables.findIndex((table) =>
      table.unique_id === ref ||
      table._id === ref ||
      table.name === ref
    )
  }

  const tableIndex = findTableIndex(tableRef)
  if (tableIndex === -1) return { error: `Table not found: ${tableRef}` }

  const table = Application.tables[tableIndex]
  if (!table.fields) table.fields = []

  const oldName = table.name
  const oldSingleName = table.singleName

  const findFieldIndex = (ref) => {
    return table.fields.findIndex((field) =>
      field.unique_id === ref || field.column_name === ref
    )
  }

  const parseFieldPayload = () => {
    if (!Parameters.FieldPayload) return {}
    try {
      return JSON.parse(Parameters.FieldPayload)
    } catch (e) {
      throw new Error('FieldPayload must be valid JSON')
    }
  }

  if (action === 'renametable') {
    if (Parameters.Name) table.name = Parameters.Name
    if (Parameters.SingleName) table.singleName = Parameters.SingleName
  }

  else if (action === 'addfield') {
    const payload = parseFieldPayload()
    const newField = {
      unique_id: payload.unique_id || aptugo.generateID(),
      ...payload
    }

    if (!newField.column_name && Parameters.ColumnName) newField.column_name = Parameters.ColumnName
    if (!newField.value && Parameters.Value) newField.value = Parameters.Value

    if (!newField.column_name) return { error: 'Missing field column_name' }
    if (!newField.data_type) return { error: 'Missing field data_type' }

    table.fields.push(newField)
  }

  else if (action === 'updatefield') {
    if (!Parameters.Field) return { error: 'Missing parameter: Field' }

    const fieldIndex = findFieldIndex(Parameters.Field)
    if (fieldIndex === -1) return { error: `Field not found: ${Parameters.Field}` }

    const payload = parseFieldPayload()
    const patch = { ...payload }

    if (Parameters.ColumnName) patch.column_name = Parameters.ColumnName
    if (Parameters.DataType) patch.data_type = Parameters.DataType

    table.fields[fieldIndex] = {
      ...table.fields[fieldIndex],
      ...patch
    }
  }

  else if (action === 'removefield') {
    if (!Parameters.Field) return { error: 'Missing parameter: Field' }

    const before = table.fields.length
    table.fields = table.fields.filter((field) =>
      field.unique_id !== Parameters.Field &&
      field.column_name !== Parameters.Field
    )

    if (table.fields.length === before) {
      return { error: `Field not found: ${Parameters.Field}` }
    }
  }

  else if (action === 'updatetableprops') {
    if (Parameters.Name) table.name = Parameters.Name
    if (Parameters.SingleName) table.singleName = Parameters.SingleName
    if (typeof Parameters.Lowercase === 'boolean') table.lowercase = Parameters.Lowercase
    if (Parameters.Subtype) table.subtype = Parameters.Subtype
  }

  else {
    return { error: `Unsupported action: ${Parameters.Action}` }
  }

  Application.tables[tableIndex] = table

  Parameters.nameChanged = oldName !== table.name
  Parameters.singleNameChanged = oldSingleName !== table.singleName

} catch (e) {
  console.log('ERROR', e)
  throw(e)
}

return Application
