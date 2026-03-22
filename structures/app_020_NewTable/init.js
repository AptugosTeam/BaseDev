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

  const normalizeFields = (fields) => {
    if (!fields) return [{
      unique_id: aptugo.generateID(),
      CHARACTER_MAXIMUM_LENGTH: "11",
      column_name: "ID",
      data_type: "Integer",
      key: "Auto Number"
    }]

    if (typeof fields === 'string') {
      try {
        fields = JSON.parse(fields)
      } catch (e) {
        throw new Error('fields must be valid JSON')
      }
    }

    return fields.map((field) => ({
      unique_id: field.unique_id || aptugo.generateID(),
      ...field
    }))
  }

  const createTable = (input) => {
    const payload = typeof input === 'object' ? input : parseValue(input) || {}

    const untitledTables = Application.tables.filter(t => t.name?.startsWith('Untitled')).length

    const name =
      payload.name ||
      `Untitled ${untitledTables > 0 ? untitledTables : ''}`

    let singleName =
      payload.singleName ||
      `Single ${name}`

    if (singleName === name) singleName = `Single ${name}`

    const newTable = {
      type: 'table',
      unique_id: payload.unique_id || aptugo.generateID(),
      name,
      singleName,
      subtype: payload.subtype || 'Aptugo',
      lowercase: payload.lowercase,
      children: [],
      fields: normalizeFields(payload.fields),
      x: payload.x || Math.floor(Math.random() * 500),
      y: payload.y || Math.floor(Math.random() * 500),
      definedRoutes: [
        {
          route_name: "Get all records",
          route_active: true,
          route_method: "get",
          route_path: "/api/{{ table.name|friendly|lower }}",
          route_template: "get"
        },
        {
          route_name: "Search records",
          route_active: true,
          route_method: "get",
          route_path: "/api/{{ table.name|friendly|lower }}/search",
          route_template: "search"
        },
        {
          route_name: "Retrieve a single record",
          route_active: true,
          route_method: "get",
          route_path: "/api/{{ table.name|friendly|lower }}/:ID",
          route_template: "getone"
        },
        {
          route_name: "Add a record",
          route_active: true,
          route_method: "post",
          route_path: "/api/{{ table.name|friendly|lower }}",
          route_template: "add"
        },
        {
          route_name: "Update a record",
          route_active: true,
          route_method: "put",
          route_path: "/api/{{ table.name|friendly|lower }}/:ID",
          route_template: "update"
        },
        {
          route_name: "Delete a record",
          route_active: true,
          route_method: "delete",
          route_path: "/api/{{ table.name|friendly|lower }}/:ID",
          route_template: "delete"
        }
      ]
    }

    Application.tables.push(newTable)
  }

  // 🔥 MAIN LOGIC

  let tablesInput =
    Parameters.Tables ||
    Parameters.tables ||
    Parameters.TablePayload ||
    Parameters.table ||
    Parameters

  tablesInput = parseValue(tablesInput)

  if (Array.isArray(tablesInput)) {
    tablesInput.forEach((tbl) => createTable(tbl))
  } else {
    createTable(tablesInput)
  }

} catch (e) {
  console.log('ERROR', e)
  throw e
}

return Application