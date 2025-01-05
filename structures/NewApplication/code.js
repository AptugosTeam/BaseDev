const dashboardID = aptugo.generateID()
const assetID = aptugo.generateID()

Application.tables = []
Application.assets = []

Application.pages = [{
	"name": "Application Root",
	"parent": false,
	"subtype": "cascade",
	"type": "page",
	"children": [
		{
			"cascades": false,
			"name": "Before Page Render",
			"type": "element",
			"value": "bpr",
			"children": [
				{
					"cascades": false,
					"name": "Load Fira Sans",
					"order": 1000,
					"type": "element",
					"value": "loadFont",
					"values": {
						"font": "Fira_Sans"
					},
					"expanded": true
				},
				{
					"cascades": false,
					"name": "Load Merriweather",
					"order": 1000,
					"type": "element",
					"value": "loadFont",
					"values": {
						"font": "Merriweather"
					}
				}
			]
		},
		{
			"cascades": false,
			"name": "Page Header",
			"open": false,
			"type": "element",
			"value": "ph",
			"children": [
				{
					"cascades": true,
					"name": "themeSelection",
					"open": false,
					"sourceType": "javascript",
					"type": "element",
					"value": "themeSelection",
					"values": {
						"theme": "minimum",
						"merge": false
					}
				}
			]
		},
		{
			"cascades": false,
			"name": "Body",
			"type": "element",
			"value": "b",
			"expanded": true
		},
		{
			"cascades": false,
			"name": "Page Footer",
			"type": "element",
			"value": "pf",
			"expanded": true
		},
		{
			"cascades": false,
			"name": "After Page Render",
			"type": "element",
			"value": "apr",
			"collapseStatus": "collapse"
		}
	]
}]

const Dashboard = {
	"filename": "dashboard.tsx",
	"name": "Dashboard",
	"path": "/",
	"type": "page",
	"unique_id": dashboardID,
	"children": [
		{
			"cascades": false,
			"name": "Before Page Render",
			"type": "element",
			"value": "bpr"
		},
		{
			"cascades": false,
			"name": "Page Header",
			"type": "element",
			"value": "ph",
			"expanded": true
		},
		{
			"cascades": true,
			"name": "Body",
			"type": "element",
			"value": "b",
			"values": {
				"className": [
					"theme.pages"
				]
			},
			"children": [
				{
					"cascades": true,
					"name": "navbar",

					"sourceType": "javascript",
					"type": "element",
					"value": "navbar",
					"values": {},
					"children": [
						{
							"cascades": false,
							"name": "autolinking",

							"sourceType": "javascript",
							"type": "element",
							"value": "autolinking",
							"values": {
								"fromLink": dashboardID
							},
							"expanded": true
						},
						{
							"cascades": false,
							"name": "themeToggle",

							"type": "element",
							"value": "themeToggle",
							"values": {}
						}
					]
				},
				{
					"cascades": false,
					"name": "Layout",

					"sourceType": "javascript",
					"type": "element",
					"value": "div",
					"values": {
						"tag": "div",
						"class": [
							"theme.layout"
						]
					},
					"children": [
						{
							"cascades": false,
							"name": "Main Area",
							"type": "element",
							"value": "div",
							"values": {
								"class": "theme.mainarea"
							},
							"children": [
								{
									"cascades": false,
									"name": "Home Container",
									"type": "element",
									"value": "div",
									"values": {
										"class": [
											"theme.homeContainer"
										]
									},
									"children": [
										{
											"cascades": false,
											"name": "Home Copy",

											"sourceType": "javascript",
											"type": "element",
											"value": "div",
											"values": {
												"tag": "div",
												"class": [
													"theme.homeCopy"
												]
											},
											"children": [
												{
													"cascades": false,
													"name": "typography",
													"type": "element",
													"value": "typography",
													"values": {
														"tag": "h1"
													},
													"children": [
														{
															"cascades": false,
															"name": "text",
															"type": "element",
															"value": "text",
															"values": {
																"Content": "Welcome to your new Aptugo application"
															},
															"expanded": true
														}
													]
												},
												{
													"cascades": false,
													"name": "typography",
													"type": "element",
													"value": "typography",
													"values": {
														"tag": "p"
													},
													"children": [
														{
															"cascades": false,
															"name": "text",
															"type": "element",
															"value": "text",
															"values": {
																"Content": "You can edit me at the Page Manager"
															},
															"expanded": true
														}
													]
												}
											]
										},
										{
											"cascades": false,
											"name": "Home Image",

											"sourceType": "javascript",
											"type": "element",
											"value": "div",
											"values": {
												"tag": "div",
												"class": [
													"theme.homeImage"
												]
											},
											"children": [
												{
													"cascades": false,
													"name": "image",

													"type": "element",
													"value": "image",
													"values": {
														"useAsset": assetID,
														"width": "385",
														"height": "424"
													},
													"expanded": true
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		},
		{
			"cascades": false,
			"name": "Page Footer",
			"type": "element",
			"value": "pf",
			"children": [
				{
					"cascades": true,
					"name": "Footer",

					"sourceType": "javascript",
					"type": "element",
					"value": "div",
					"values": {
						"tag": "footer"
					},
					"children": [
						{
							"cascades": false,
							"name": "text",

							"render": "(elem) => { return elem.values.Content }",
							"renderTag": "span",
							"sourceType": "javascript",
							"type": "element",
							"value": "text",
							"values": {
								"Content": "© 2024. Powered by "
							},
							"expanded": true
						},
						{
							"cascades": false,
							"name": "Link to Aptugo",

							"renderTag": "a",
							"sourceType": "javascript",
							"type": "element",
							"value": "simpleLink",
							"values": {
								"destination": "https://www.aptugo.com",
								"tagToUse": "A",
								"target": "_blank"
							},
							"children": [
								{
									"cascades": false,
									"name": "text",

									"render": "(elem) => { return elem.values.Content }",
									"renderTag": "span",
									"sourceType": "javascript",
									"type": "element",
									"value": "text",
									"values": {
										"Content": "Aptugo"
									}
								}
							]
						},
						{
							"cascades": false,
							"name": "text",

							"render": "(elem) => { return elem.values.Content }",
							"renderTag": "span",
							"sourceType": "javascript",
							"type": "element",
							"value": "text",
							"values": {
								"Content": ". Application by HalTugo"
							}
						}
					]
				}
			]
		},
		{
			"cascades": false,
			"name": "After Page Render",
			"type": "element",
			"value": "apr"
		}
	]
}

const file = aptugo.readFile('/Users/gaston/Aptugo/templates/Next/public/HaltugoBLocks001.png')

Application = await aptugo.structures.run('importImage', {
	app: Application,
	id: assetID,
	uploadFiles: [{
		name: 'HaltugoBLocks001.png',
		contents: file
	}]
})

Application.pages[0].children.push(Dashboard)




return Application