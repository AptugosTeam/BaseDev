const dashboardID = aptugo.generateID()

const PageHeader = {
	"path": "ph.tpl",
	"completePath": "elements/Aptugo Internal Use/ph.tpl",
	"open": false,
	"children": [{
			"path": "themeSelection.tpl",
			"completePath": "elements/Experimental/themeSelection.tpl",
			"type": "element",
			"icon": "ico-theme-selection",
			"options": [{
					"name": "theme",
					"display": "Theme",
					"type": "dropdown",
					"options": "website;whatsapp;layout;fantasyx;crm;minimum;prototyping"
				},
				{
					"name": "useAsset",
					"display": "Use an Asset",
					"type": "dropdown",
					"options": "return [['none', 'none'], ...aptugo.assetUtils.stylesheets().map(stylesheet => [stylesheet.id, stylesheet.name])]",
					"settings": {
						"aptugoOnChange": "element = arguments[0]\nvar selectedAsset = element.values?.useAsset\nif (selectedAsset !== 'none') {\n//  const assetInfo = aptugo.assetUtils.stylesheets().find(ss => ss.id === //selectedAsset)\n//  const currentPage = //aptugo.pageUtils.findContainerPage(aptugo.variables.retrieveGlobalVariables('currentElement').unique_id).unique_id\n//  aptugo.variables.setPageVariable(currentPage,{ theme: assetInfo })\n\n  console.log('onchange', element, selectedAsset)\n}",
						"aptugoOnLoad": "element = arguments[0];\nvar selectedAsset = (element.values?.useAsset && element.values?.useAsset !== 'none') ? element.values?.useAsset : null;\nif (selectedAsset) {\n  const assetInfo = aptugo.assetUtils.stylesheets().find(ss => ss.id === selectedAsset);\n  const currentPage = aptugo.pageUtils.findContainerPage(element).unique_id;\n  const cssinfo = aptugo.assetUtils.grabCssSelectors(assetInfo)\n  aptugo.variables.setPageVariable(currentPage, element.unique_id, { theme: cssinfo, hidden: selectedAsset })\n}"
					}
				}
			],
			"sourceType": "javascript",
			"children": [],
			"open": false,
			"name": "themeSelection",
			"cascades": true,
			"value": "themeSelection",
			"values": {
				"theme": "minimum"
			},
			"prevent_delete": false
		},
		{
			"path": "dummyEncloser.tpl",
			"completePath": "elements/Basic/dummyEncloser.tpl",
			"children": [{
					"path": "useState.tpl",
					"completePath": "elements/Programming/useState.tpl",
					"type": "element",
					"icon": "ico-use-state",
					"options": [{
							"name": "variableName",
							"display": "Variable Name",
							"type": "text",
							"options": "",
							"settings": {
								"aptugoOnLoad": "const element = arguments[0]; const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id; if (element.values.variableName) {\n  aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: element.values ? element.values.defaultValue : null });\n  aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${element.values.variableName}` );\n}",
								"aptugoOnChange": "const value = arguments[0]; const element = arguments[1]; const page = arguments[2]; if (element.values?.variableName) {\n  aptugo.variables.setPageVariable(page, element.unique_id, { [value]: element.values ? element.values.defaultValue : null });\n  aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${element.values.variableName}` );\n}",
								"active": true
							}
						},
						{
							"name": "defaultValue",
							"display": "Default Value",
							"type": "text",
							"options": "",
							"settings": {
								"aptugoOnChange": "const value = arguments[0]; const element = arguments[1]; const page = arguments[2]; if ( element.values.variableName ) aptugo.variables.setPageVariable(page, element.unique_id, { [element.values.variableName]: value });",
								"active": true
							}
						}
					],
					"children": [],
					"open": false,
					"name": "Language",
					"cascades": false,
					"value": "useState",
					"values": {
						"variableName": "lang",
						"defaultValue": "'en'"
					},
					"prevent_delete": false
				},
				{
					"path": "onPageLoad.tpl",
					"completePath": "elements/Programming/onPageLoad.tpl",
					"type": "element",
					"icon": "ico-field",
					"helpText": "Executes commands when DOM has been loaded and renderized",
					"open": false,
					"children": [{
						"path": "condition.tpl",
						"completePath": "elements/Programming/condition.tpl",
						"type": "element",
						"icon": "ico-condition",
						"sourceType": "javascript",
						"options": [{
								"name": "condition",
								"display": "Condition",
								"type": "text",
								"options": ""
							},
							{
								"name": "usefragment",
								"display": "Do Not Use Fragment",
								"type": "checkbox",
								"options": ""
							},
							{
								"name": "useInCode",
								"display": "This condition is part of code",
								"type": "checkbox"
							}
						],
						"helpText": "Make a decision based on a value",
						"children": [{
							"name": "updateStateVariable",
							"value": "updateStateVariable",
							"values": {
								"variable": "lang",
								"newvalue": "langStrings[localStorage.getItem('aptugolang') || 'en']"
							},
							"type": "element",
							"children": [],
							"prevent_delete": false,
							"cascades": false
						}],
						"open": false,
						"name": "Lang Strings Exist?",
						"prevent_delete": false,
						"cascades": false,
						"value": "condition",
						"values": {
							"condition": "typeof langStrings !== 'undefined'",
							"useInCode": true
						}
					}],
					"name": "onPageLoad",
					"cascades": false,
					"value": "onPageLoad",
					"prevent_delete": false
				}
			],
			"icon": "ico-dummy-enclosure",
			"helpText": "Organizational unit with no render value",
			"open": false,
			"name": "Language",
			"cascades": true,
			"type": "element",
			"value": "dummyEncloser",
			"prevent_delete": false
		}
	],
	"name": "Page Header",
	"cascades": false,
	"type": "element",
	"value": "ph",
	"prevent_delete": false
}

Application.pages = [{
	"name": "Application Root",
	"type": "page",
	"subtype": "cascade",
	"prevent_delete": true,
	"children": [
		{
			"name": "Before Page Render",
			"type": "element",
			"value": "bpr",
			"prevent_delete": true,
			"cascades": false,
			"children": [],
			"collapseStatus": "expand"
		},
		PageHeader,
		{
			"name": "Body",
			"type": "element",
			"value": "b",
			"prevent_delete": true,
			"children": [],
			"cascades": false,
			"collapseStatus": "expand"
		},{
			"name": "Page Footer",
			"type": "element",
			"value": "pf",
			"prevent_delete": true,
			"cascades": false,
			"children": [],
			"collapseStatus": "expand"
		},{
			"name": "After Page Render",
			"type": "element",
			"value": "apr",
			"prevent_delete": true,
			"cascades": false,
			"children": [],
			"collapseStatus": "collapse"
		},{
			"name": "Dashboard",
			"unique_id": dashboardID,
			"type": "page",
			"path": "/",
			"filename": "dashboard.tsx",
			"prevent_delete": false,
			"children": [{
				"name": "Before Page Render",
				"type": "element",
				"value": "bpr",
				"prevent_delete": true,
				"cascades": false,
				"children": [],
				"collapseStatus": "collapse",
			}, {
				"name": "Page Header",
				"type": "element",
				"value": "ph",
				"prevent_delete": true,
				"cascades": false,
				"children": [],
				"collapseStatus": "expand",
			}, {
				"name": "Body",
				"type": "element",
				"value": "b",
				"prevent_delete": true,
				"children": [{
					"name": "sidebar",
					"prevent_delete": false,
					"cascades": true,
					"children": [{
						"name": "navLink",
						"prevent_delete": false,
						"cascades": false,
						"children": [],
						"type": "element",
						"value": "navLink",
						"collapseStatus": "expand",
						"values": {
							"Destination": "/",
							"destination": "/",
							"linkText": "Home"
						},
					}, {
						"name": "autolinking",
						"prevent_delete": false,
						"cascades": false,
						"children": [],
						"type": "element",
						"value": "autolinking",
						"collapseStatus": "expand",
						"values": {
							"fromLink": dashboardID
						},
					}],
					"type": "element",
					"value": "sidebar",
					"collapseStatus": "collapse",
					"values": {
						"colorSchema": "Greens",
						"open": "true"
					},
				}, {
					"name": "Main Area",
					"prevent_delete": false,
					"children": [{
						"name": "div - Hello Text",
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
									"Content": "Hello!"
								},
							}],
							"type": "element",
							"value": "typography",
							"collapseStatus": "collapse",
							"values": {
								"tag": "h1"
							},
						}, {
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
									"Content": "I'm your Aptugo application"
								},
							}],
							"type": "element",
							"value": "typography",
							"collapseStatus": "collapse",
							"values": {
								"tag": "body1"
							},
						}, {
							"name": "text",
							"prevent_delete": false,
							"cascades": false,
							"children": [],
							"type": "element",
							"value": "text",
							"collapseStatus": "expand",
							"values": {
								"Content": "<span>(you can edit me at the Page Manager)</span>"
							},
						}],
						"type": "element",
						"value": "div",
						"collapseStatus": "expand",
						"values": {
							"class": "classes.bigHello"
						},
					}],
					"type": "element",
					"value": "div",
					"values": {
						"class": "theme.mainarea"
					},
					"cascades": false,
					"collapseStatus": "expand",
				}],
				"cascades": true,
				"collapseStatus": "expand",
				"values": {
					"className": ["theme.pages"]
				},
			}, {
				"name": "Page Footer",
				"type": "element",
				"value": "pf",
				"prevent_delete": true,
				"cascades": false,
				"children": [],
				"collapseStatus": "collapse",
			}, {
				"name": "After Page Render",
				"type": "element",
				"value": "apr",
				"prevent_delete": true,
				"cascades": false,
				"children": [],
				"collapseStatus": "collapse",
			}],
			"collapseStatus": "expand"
		}
	],
	"path": "",
	"parent": null,
	"collapseStatus": "expand"
}]

Application.tables = []
Application.assets = []

return Application