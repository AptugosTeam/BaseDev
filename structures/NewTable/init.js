Parameters.unique_id = aptugo.generateID()
if (!Application.tables) Application.tables = []
const untitledTables = Application.tables.filter(table => table.name.substr(0,8) === 'Untitled').length
const name = Parameters.name || `Untitled ${untitledTables > 0 ? untitledTables : ''}`
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
	fields: fields
}

if (!Application.tables) Application.tables = []
Application.tables.push(newTable)

return Application