Parameters.unique_id = Parameters.unique_id || aptugo.generateID()
if (!Application.tables) Application.tables = []
const untitledTables = Application.tables.filter(table => table.name.substr(0,8) === 'Untitled').length
const name = Parameters.name || `Untitled ${untitledTables > 0 ? untitledTables : ''}`
const singleName = Parameters.singleName || `Single ${name}`
const fields = Parameters.fields || [{
	CHARACTER_MAXIMUM_LENGTH: "11",
	column_name: "ID",
	data_type: "Integer",
	key: "Auto Number"
}]

const newTable = {
	type: 'table',
	unique_id: Parameters.unique_id,
	name: name,
	singleName: singleName,
	subtype: 'Aptugo',
	children: [],
	fields: fields,
	x: Parameters.x || Math.floor(Math.random() * 500),
  y: Parameters.y || Math.floor(Math.random() * 500),
	definedRoutes: [{
		route_name: "Get all records",
    route_active: true,
    route_method: "get",
    route_path: "/api/{{ table.name|friendly|lower }}",
      route_code: null,
      route_template: "get"
    },
    {
      route_name: "Search records",
      route_active: true,
      route_method: "get",
      route_path: "/api/{{ table.name|friendly|lower }}/search",
      route_code: null,
      route_template: "search"
    },
    {
      route_name: "Retrieve a single record",
      route_active: true,
      route_method: "get",
      route_path: "/api/{{ table.name|friendly|lower }}/:ID",
      route_code: null,
      route_template: "getone"
    },
    {
      route_name: "Add a record",
      route_active: true,
      route_method: "post",
      route_path: "/api/{{ table.name|friendly|lower }}",
      route_code: null,
      route_template: "add"
    },
    {
      route_name: "Update a record",
      route_active: true,
      route_method: "put",
      route_path: "/api/{{ table.name|friendly|lower }}/:ID",
      route_code: null,
      route_template: "update"
    },
    {
      route_name: "Delete a record",
      route_active: true,
      route_method: "delete",
      route_path: "/api/{{ table.name|friendly|lower }}/:ID",
      route_code: null,
      route_template: "delete"
    }
  ],
}

if (!Application.tables) Application.tables = []
Application.tables.push(newTable)

return Application