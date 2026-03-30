try {
  if (!Application.tables) Application.tables = []

  const parseValue = (value) => {
    if (typeof value !== 'string') return value
    const trimmed = value.trim()
    if (!trimmed) return value

    if (
      (trimmed.startsWith('{') && trimmed.endsWith('}')) ||
      (trimmed.startsWith('[') && trimmed.endsWith(']'))
    ) {
      try {
        return JSON.parse(trimmed)
      } catch (e) {
        throw new Error('Invalid JSON value')
      }
    }

    return value
  }

  const toArray = (value) => {
    const parsed = parseValue(value)
    if (parsed === undefined || parsed === null || parsed === '') return []
    return Array.isArray(parsed) ? parsed : [parsed]
  }

  const findTable = (ref) => {
    if (!ref) return null
    return Application.tables.find(
      (t) => t.unique_id === ref || t.name === ref
    )
  }

  const normalizeField = (field) => {
    if (!field || typeof field !== 'object') {
      throw new Error('Field must be an object')
    }

    if (!field.column_name) {
      throw new Error('Field must include column_name')
    }

    if (!field.data_type) {
      throw new Error('Field must include data_type')
    }

    return {
      unique_id: field.unique_id || aptugo.generateID(),
      ...field
    }
  }

  const buildFieldFromParameters = () => {
    const payload =
      parseValue(Parameters.FieldPayload) ||
      parseValue(Parameters.fieldPayload)

    if (payload && typeof payload === 'object' && !Array.isArray(payload)) {
      return normalizeField(payload)
    }

    if (!Parameters.ColumnName && !Parameters.column_name) return null
    if (!Parameters.DataType && !Parameters.data_type) return null

    const field = {
      column_name: Parameters.ColumnName || Parameters.column_name,
      data_type: Parameters.DataType || Parameters.data_type
    }

    if (Parameters.Value !== undefined) field.Value = Parameters.Value
    if (Parameters.Options !== undefined) field.options = Parameters.Options
    if (Parameters.RelationshipType !== undefined) field.relationshipType = Parameters.RelationshipType
    if (Parameters.Reference !== undefined) field.reference = Parameters.Reference
    if (Parameters.Key !== undefined) field.key = Parameters.Key
    if (Parameters.CHARACTER_MAXIMUM_LENGTH !== undefined) {
      field.CHARACTER_MAXIMUM_LENGTH = Parameters.CHARACTER_MAXIMUM_LENGTH
    }

    return normalizeField(field)
  }

  const fieldsInput =
    parseValue(Parameters.Fields) ||
    parseValue(Parameters.fields)

  let fieldsToAdd = []

  if (fieldsInput) {
    if (!Array.isArray(fieldsInput)) {
      throw new Error('Fields must be a valid JSON array')
    }
    fieldsToAdd = fieldsInput.map(normalizeField)
  } else {
    const singleField = buildFieldFromParameters()
    if (!singleField && !Parameters.fromUI) {
      throw new Error('You must provide either Fields, FieldPayload, or ColumnName + DataType')
    }
    fieldsToAdd = [singleField]
  }

  if (Parameters.fromUI) {
    // If called from UI, return from here
    return { ...fieldsToAdd[0], unique_id: aptugo.generateID(), column_name: 'New Field', data_type: 'String' }
  } else {
    let tablesInput =
      parseValue(Parameters.Tables) ||
      parseValue(Parameters.tables)

    if (!tablesInput || (Array.isArray(tablesInput) && tablesInput.length === 0)) {
      tablesInput = [Parameters.Table || Parameters.table]
    }

    const tableRefs = toArray(tablesInput).filter(Boolean)

    if (!tableRefs.length ) {
      throw new Error('You must provide Table or Tables')
    }

    tableRefs.forEach((tableRef) => {
      const table = findTable(tableRef)
      if (!table) {
        throw new Error(`Table not found: ${tableRef}`)
      }

      if (!table.fields) table.fields = []

      fieldsToAdd.forEach((field) => {
        const exists = table.fields.find(
          (f) =>
            f.unique_id === field.unique_id ||
            f.column_name === field.column_name
        )

        if (exists) {
          throw new Error(
            `Field already exists in table ${table.name}: ${field.column_name}`
          )
        }

        table.fields.push({
          ...field,
          unique_id: field.unique_id || aptugo.generateID()
        })
      })
    })

  }
  
} catch (e) {
  console.log('ERROR', e)
  throw e
}

return Application