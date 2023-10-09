// Code for new Pages

const bpr = {
	"name": "Before Page Render",
	"type": "element",
	"value": "bpr",
	"prevent_delete": true,
	"cascades": false,
	"children": [],
	"collapseStatus": "collapse",
}

const ph = {
	"name": "Page Header",
	"type": "element",
	"value": "ph",
	"prevent_delete": true,
	"children": [],
	"cascades": false,
	"collapseStatus": "collapse",
}

const b_head = {
	"name": "Head",
	"prevent_delete": false,
	"cascades": false,
	"children": [{
		"name": "typography",
		"prevent_delete": false,
		"cascades": false,
		"children": [{
			"name": "text",
			"prevent_delete": false,
			"cascades": false,
			"children": [],
			"type": "element",
			"value": "text",
			"collapseStatus": "expand",
			"values": {
				"Content": `() => { return aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").singleName + " list" }`,
			},
		}],
		"type": "element",
		"value": "typography",
		"collapseStatus": "expand",
		"values": {
			"tag": "h4"
		},
	},{
		"name": "searchField",
		"prevent_delete": false,
		"cascades": false,
		"children": [],
		"type": "element",
		"value": "searchField",
		"collapseStatus": "expand",
		"values": {
			"table": Parameters.unique_id,
		}
	},{
		"name": "dialog",
		"prevent_delete": false,
		"cascades": false,
		"children": [],
		"type": "element",
		"value": "dialog",
		"collapseStatus": "expand",
		"values": {
			"addProcedure": "Internal",
			"title": `() => { return "Add " + aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").singleName }`,
			"introText": `() => { return "Enter " + aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").singleName + " data" }`,
			"color": "primary",
			"table": Parameters.unique_id,
			"button": "Add",
			"editButton": "Edit",
			"editTitle": `() => { return "Edit " + aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").singleName }`,
			"editIntroText": `() => { return "Update " + aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").singleName + " data" }`,
		},
	}],
	"type": "element",
	"value": "div",
	"collapseStatus": "expand",
	"values": {
		"class": "theme.tableHeading"
	},
}

const b_container = {
	"name": "Container",
	"prevent_delete": false,
	"cascades": false,
	"children": [{
		"name": "Table Area",
		"prevent_delete": false,
		"cascades": false,
		"children": [{
			"name": "Body",
			"prevent_delete": false,
			"cascades": false,
			"children": [{
				"name": "Data Table",
				"prevent_delete": false,
				"cascades": false,
				"children": [],
				"type": "element",
				"value": "dataTable",
				"collapseStatus": "expand",
				"values": {
					"table": Parameters.unique_id,
					"editProcedure": "Internal"
				},
			}],
			"type": "element",
			"value": "div",
			"collapseStatus": "expand",
		}],
		"type": "element",
		"value": "div",
		"collapseStatus": "expand",
		"values": {
			"class": "classes.tableResponsive"
		},
	}],
	"type": "element",
	"value": "Container",
	"collapseStatus": "expand",
	"values": {
		"maxWidth": "false"
	}
}


const b = {
	"name": "Body",
	"type": "element",
	"value": "b",
	"prevent_delete": true,
	"cascades": false,
	"children": [{
		"name": "div",
		"prevent_delete": false,
		"cascades": false,
		"type": "element",
		"value": "div",
		"collapseStatus": "expand",
		"values": {
			"class": "theme.mainarea"
		},
		"children": [b_head, b_container],
	}],
	"collapseStatus": "expand",
	"values": {
		"className": ["theme.pages"],
		"primaryColor": "green"
	}
}

const pf = {
	"name": "Page Footer",
	"type": "element",
	"value": "pf",
	"prevent_delete": true,
	"cascades": false,
	"children": [],
	"collapseStatus": "expand",
}

const apr = {
	"name": "After Page Render",
	"type": "element",
	"value": "apr",
	"prevent_delete": true,
	"cascades": false,
	"children": [],
	"collapseStatus": "collapse",
}

const newPage = {
	"asociated_table": Parameters.unique_id,
	"name": `() => aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").name`,
	"type": "page",
	"children": [bpr, ph, b, pf, apr],
	"path": `() => '/' + aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").name`,
	"parent": Application.pages[0].unique_id,
	"collapseStatus": "collapse",
	"filename": `() => aptugo.store.getState().application.tables.find(table => table.unique_id === "${Parameters.unique_id}").name + '.tsx'`
}

if (Parameters.parent) {
	Parameters.parent.children.push(newPage)
} else {
	Application.pages[0].children.push(newPage)
}
return Application