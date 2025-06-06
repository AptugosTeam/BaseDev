Parameters.table_unique_id = aptugo.generateID()
Parameters.currentUserVar_unique_id = aptugo.generateID()
Parameters.mainPageID = Application.pages[0].children[5]?.unique_id
const friendlyName = aptugo.friendly("Users").toLowerCase()
const userTable = {
	"unique_id": Parameters.table_unique_id,
	"type": "table",
	"name": "Users",
	"singleName": "Users" + "record",
	"subtype": "Aptugo",
	"fields": [{
		"column_name": "FirstName",
		"data_type": "String",
		"displaylabel": "First Name",
		"prompt": "First Name",
		"validators.required": true,
	}, {
		"column_name": "LastName",
		"data_type": "String",
		"displaylabel": "Last Name",
		"prompt": "Last Name",
		"validators.required": true,
	}, {
		"column_name": "Email",
		"data_type": "String",
		"displaylabel": "Email",
		"prompt": "Email",
		"validators.unique": true,
		"validators.validEmail": true
	}, {
		"column_name": "Password",
		"data_type": "Password",
		"validators.required": true
	}, {
		"column_name": "ProfilePic",
		"data_type": "Image",
		"displaylabel": "Profile Picture",
		"prompt": "Profile Picture",
	}, {
		"column_name": "Role",
		"data_type": "Dropdown",
		"options": "User;Admin",
	}],
	"beforeCreate": "",
	"beforeUpdate": "const response = userService.jwtVerify(req.headers.authorization)\nif (response.error) { res.status(401).json(response); return }\n",
	"beforeDelete": "const response = userService.jwtVerify(req.headers.authorization)\nif (response.error) { res.status(401).json(response); return }\n",
	"extraRoutes": "// Authenticate User\n  app.post('/api/users/authenticate', function (req, res) {\n    userService\n      .authenticate(req.body)\n      .then((user) => {\n        res.json(user)\n      })\n      .catch((next) => {\n        res.statusCode = 401\n        res.json(next)\n        \n      })\n  })",
	"extraModules": "const userService = require('../services/users.service')",
	"definedRoutes": [{
		"route_name": "Get all records",
		"route_active": true,
		"route_method": "get",
		"route_path": "/api/" + friendlyName,
		"route_code": null,
		"route_template": "get"
	}, {
		"route_name": "Search records",
		"route_active": true,
		"route_method": "get",
		"route_path": "/api/" + friendlyName + "/search",
		"route_code": null,
		"route_template": "search"
	}, {
		"route_name": "Retrieve a single record",
		"route_active": true,
		"route_method": "get",
		"route_path": "/api/" + friendlyName + "/:ID",
		"route_code": null,
		"route_template": "getone"
	}, {
		"route_name": "Add a record",
		"route_active": true,
		"route_method": "post",
		"route_path": "/api/" + friendlyName,
		"route_code": null,
		"route_template": "add"
	}, {
		"route_name": "Update a record",
		"route_active": true,
		"route_method": "put",
		"route_path": "/api/" + friendlyName + "/:ID",
		"route_code": null,
		"route_template": "update"
	}, {
		"route_name": "Soft delete a record",
		"route_active": true,
		"route_method": "delete",
		"route_path": "/api/" + friendlyName + "/soft/:ID",
		"route_code": null,
		"route_template": "softDelete"
	}, {
		"route_name": "Delete a record",
		"route_active": true,
		"route_method": "delete",
		"route_path": "/api/" + friendlyName + "/:ID",
		"route_code": null,
		"route_template": "delete"
	}, {
		"route_method": "post",
		"route_template": "source",
		"route_active": true,
		"route_name": "Send Nonce",
		"route_path": "/api/" + friendlyName + "/recoverpassword",
		"route_code": "userService\n      .recoverPassword(req)\n      .then((user) => {\n        res.json('ok')\n      })\n      .catch((next) => {\n        res.statusCode = 401\n        res.json(next)\n      })"
	}, {
		"route_method": "post",
		"route_template": "source",
		"route_active": true,
		"route_name": "Check Nonce",
		"route_path": "/api/" + friendlyName + "/checknonce",
		"route_code": "userService\n      .checkNonce(req)\n      .then((user) => {\n        res.json(user)\n      })\n      .catch((next) => {\n        res.statusCode = 500\n        res.json(next)\n      })"
	}]
}

if (!Application.tables) Application.tables = []
Application.tables.push(userTable)

return Application