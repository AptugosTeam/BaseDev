const secureZonePH = {
  "path": "ph.tpl",
  "keyPath": "elements/Aptugo Internal Use/ph.tpl",
  "prevent_delete": true,
  "children": [
    {
      "path": "useState.tpl",
      "keyPath": "elements/Programming/useState.tpl",
      "type": "element",
      "children": [],
      "cascades": true,
      "name": "Profile Menu Anchor",
      "prevent_delete": false,
      "value": "useState",
      "values": {
        "defaultValue": "null",
        "variableName": "profileMenuAnchor"
      }
    },
    {
      "path": "useState.tpl",
      "keyPath": "elements/Programming/useState.tpl",
      "type": "element",
      "children": [],
      "cascades": true,
      "name": "Current User",
      "prevent_delete": false,
      "value": "useState",
      "unique_id": Parameters.currentUserVar_unique_id,
      "values": {
        "defaultValue": "{}",
        "variableName": "currentUser"
      }
    },
    {
      "cascades": true,
      "name": "getCurrentUser",
      "path": "getCurrentUser.tpl",
      "prevent_delete": false,
      "type": "element",
      "value": "getCurrentUser",
      "values": {
        "variableName": Parameters.currentUserVar_unique_id
      }
    },
    {
      "cascades": true,
      "name": "checkIfLoggedIn",
      "path": "checkIfLoggedIn.tpl",
      "prevent_delete": false,
      "type": "element",
      "value": "checkIfLoggedIn",
      "values": {
        "loginScreenNot": Parameters.mainPageID
      }
    }
  ],
  "cascades": false,
  "name": "Page Header",
  "type": "element",
  "value": "ph"
}

const secureZone = {
  "name": "Restricted Zone",
	"type": "page",
	"path": "",
	"filename": "",
	"parent": false,
	"collapseStatus": "expand",
	"children": [{
		"children": [],
		"name": "Before Page Render",
		"type": "element",
		"value": "bpr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand"
	}, secureZonePH, {
		"name": "Body",
		"type": "element",
		"value": "b",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"children": [{
			"children": [{
				"children": [{
					"children": [{
						"name": "image",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "image",
						"collapseStatus": "expand",
						"values": {
							"path": "/img/${currentUser.ProfilePic}",
							"ClassName": []
						},
						"children": [],
					}],
					"name": "IconButton",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "IconButton",
					"collapseStatus": "expand",
					"values": {
						"className": "theme.profilePicture",
						"Action": "(event) => { setprofileMenuAnchor(event.currentTarget) }"
					},
				}, {
					"children": [{
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "{currentUser.FirstName} {currentUser.LastName}"
							},
							"children": [],
						}],
						"name": "div",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "div",
						"collapseStatus": "expand",
						"values": {
							"class": "theme.menuProfileDetails"
						},
					}, {
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Profile"
							},
							"children": [],
						}],
						"name": "MenuItem",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "MenuItem",
						"collapseStatus": "expand",
					}, {
						"children": [{
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "Logout"
							},
							"children": [],
						}],
						"name": "MenuItem",
						"prevent_delete": false,
						"cascades": false,
						"type": "element",
						"value": "MenuItem",
						"collapseStatus": "expand",
						"values": {
							"onclick": "(params) => { AuthService.logout(); props.history.push('/') }"
						},
					}],
					"name": "Menu",
					"prevent_delete": false,
					"cascades": false,
					"type": "element",
					"value": "Menu",
					"collapseStatus": "expand",
					"values": {
						"anchorElement": "profileMenuAnchor",
						"onClose": "(params) => { setprofileMenuAnchor(null)}"
					},
				}],
				"name": "navbar",
				"prevent_delete": false,
				"cascades": true,
				"type": "element",
				"value": "navbar",
				"collapseStatus": "expand",
				"values": {
					"Title": "",
					"Color": "transparent",
					"Position": "absolute",
					"Elevation": "3"
				},
			}],
			"name": "condition",
			"prevent_delete": false,
			"cascades": true,
			"type": "element",
			"value": "condition",
			"collapseStatus": "expand",
			"values": {
				"condition": "currentUser"
			},
		}]
	}, {
		"name": "Page Footer",
		"type": "element",
		"value": "pf",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "expand",
		"children": []
	}, {
		"name": "After Page Render",
		"type": "element",
		"value": "apr",
		"prevent_delete": true,
		"cascades": false,
		"collapseStatus": "collapse",
		"children": []
	}]
}

Application = await aptugo.structures.run('Autocreate ABM pages', {
  unique_id: Parameters.table_unique_id,
  parent: secureZone,
  state: { ...State, app: Application },
});

Application.pages[0].children.push(secureZone)

return Application;
