
const PH = {
	"path": "dummyEncloser.tpl",
	"completePath": "elements/Basic/dummyEncloser.tpl",
	"children": [{
			"path": "defineVariable.tpl",
			"completePath": "elements/Programming/defineVariable.tpl",
			"type": "element",
			"icon": "ico-define-variable",
			"helpText": "Allows you to define a variable that will be used later",
			"options": [{
					"name": "variableName",
					"display": "Name",
					"type": "text",
					"options": ""
				},
				{
					"name": "variableValue",
					"display": "Value",
					"type": "text",
					"options": ""
				},
				{
					"name": "willbeModified",
					"display": "Will it be modified?",
					"type": "checkbox",
					"options": ""
				},
				{
					"name": "serverSide",
					"display": "Back-End Variable",
					"type": "checkbox"
				}
			],
			"settings": [{
				"name": "ServerAddenum",
				"value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
			}],
			"sourceType": "javascript",
			"children": [],
			"open": false,
			"name": "About Us Title",
			"cascades": false,
			"value": "defineVariable",
			"values": {
				"variableName": "aboutTitle",
				"variableValue": "''",
				"willbeModified": true
			},
			"prevent_delete": false
		},
		{
			"path": "defineVariable.tpl",
			"completePath": "elements/Programming/defineVariable.tpl",
			"type": "element",
			"icon": "ico-define-variable",
			"helpText": "Allows you to define a variable that will be used later",
			"options": [{
					"name": "variableName",
					"display": "Name",
					"type": "text",
					"options": ""
				},
				{
					"name": "variableValue",
					"display": "Value",
					"type": "text",
					"options": ""
				},
				{
					"name": "willbeModified",
					"display": "Will it be modified?",
					"type": "checkbox",
					"options": ""
				},
				{
					"name": "serverSide",
					"display": "Back-End Variable",
					"type": "checkbox"
				}
			],
			"settings": [{
				"name": "ServerAddenum",
				"value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
			}],
			"sourceType": "javascript",
			"children": [],
			"open": false,
			"name": "About Us Body",
			"cascades": false,
			"value": "defineVariable",
			"values": {
				"variableName": "aboutBody",
				"variableValue": "''",
				"willbeModified": true
			},
			"prevent_delete": false
		},
		{
			"path": "defineVariable.tpl",
			"completePath": "elements/Programming/defineVariable.tpl",
			"type": "element",
			"icon": "ico-define-variable",
			"helpText": "Allows you to define a variable that will be used later",
			"options": [{
					"name": "variableName",
					"display": "Name",
					"type": "text",
					"options": ""
				},
				{
					"name": "variableValue",
					"display": "Value",
					"type": "text",
					"options": ""
				},
				{
					"name": "willbeModified",
					"display": "Will it be modified?",
					"type": "checkbox",
					"options": ""
				},
				{
					"name": "serverSide",
					"display": "Back-End Variable",
					"type": "checkbox"
				}
			],
			"settings": [{
				"name": "ServerAddenum",
				"value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
			}],
			"sourceType": "javascript",
			"children": [],
			"open": false,
			"name": "About Us Socials",
			"cascades": false,
			"value": "defineVariable",
			"values": {
				"variableName": "aboutSocials",
				"variableValue": "''",
				"willbeModified": true
			},
			"prevent_delete": false
		},
		{
			"path": "defineVariable.tpl",
			"completePath": "elements/Programming/defineVariable.tpl",
			"type": "element",
			"icon": "ico-define-variable",
			"helpText": "Allows you to define a variable that will be used later",
			"options": [{
					"name": "variableName",
					"display": "Name",
					"type": "text",
					"options": ""
				},
				{
					"name": "variableValue",
					"display": "Value",
					"type": "text",
					"options": ""
				},
				{
					"name": "willbeModified",
					"display": "Will it be modified?",
					"type": "checkbox",
					"options": ""
				},
				{
					"name": "serverSide",
					"display": "Back-End Variable",
					"type": "checkbox"
				}
			],
			"settings": [{
				"name": "ServerAddenum",
				"value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
			}],
			"sourceType": "javascript",
			"children": [],
			"open": false,
			"name": "Image: About Image Path",
			"cascades": false,
			"value": "defineVariable",
			"values": {
				"variableName": "aboutImagePath",
				"willbeModified": true,
				"variableValue": "''"
			},
			"prevent_delete": false
		}
	],
	"icon": "ico-dummy-enclosure",
	"helpText": "Organizational unit with no render value",
	"options": [{
		"name": "titleAsComment",
		"display": "Use Name as Comment",
		"type": "checkbox",
		"options": ""
	}],
	"open": false,
	"name": "Config: AboutUs",
	"cascades": false,
	"type": "element",
	"value": "dummyEncloser",
	"prevent_delete": false
}
  
  const B = {
	"path": "Container.tpl",
	"completePath": "elements/Material-UI/Container.tpl",
	"type": "element",
	"icon": "ico-field",
	"helpText": "The container centers your content horizontally. It's the most basic layout element.",
	"options": [{
			"name": "disableGutters",
			"display": "Disable Gutters",
			"type": "checkbox",
			"options": ""
		},
		{
			"name": "fixed",
			"display": "Fixed?",
			"type": "checkbox",
			"options": ""
		},
		{
			"name": "maxWidth",
			"display": "Max Width",
			"type": "dropdown",
			"options": "lg;md;sm;xl;xs;false"
		},
		{
			"name": "className",
			"display": "className",
			"type": "text",
			"options": ""
		}
	],
	"sourceType": "javascript",
	"children": [{
		"path": "grid.tpl",
		"completePath": "elements/Material-UI/grid.tpl",
		"children": [{
				"path": "grid.tpl",
				"completePath": "elements/Material-UI/grid.tpl",
				"children": [{
						"path": "typography.tpl",
						"completePath": "elements/Material-UI/typography.tpl",
						"children": [{
							"path": "text.tpl",
							"completePath": "elements/Basic/text.tpl",
							"type": "element",
							"icon": "ico-text",
							"helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
							"sourceType": "javascript",
							"options": [{
									"name": "Content",
									"display": "Content",
									"type": "text",
									"options": ""
								},
								{
									"name": "ClassName",
									"display": "ClassName",
									"type": "text",
									"options": ""
								}
							],
							"children": [],
							"open": false,
							"name": "Text Content",
							"cascades": false,
							"value": "text",
							"values": {
								"Content": "{aboutTitle}"
							},
							"prevent_delete": false
						}],
						"icon": "ico-typography",
						"helpText": "Renders different typographic html elements",
						"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
						"options": [{
							"name": "tag",
							"display": "Tag",
							"type": "dropdown",
							"options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
						}],
						"childs": [{
							"name": "Text Content",
							"element": "text"
						}],
						"open": false,
						"name": "typography",
						"originalName": "typography",
						"cascades": false,
						"type": "element",
						"value": "typography",
						"values": {
							"tag": "h1"
						},
						"prevent_delete": false
					},
					{
						"path": "typography.tpl",
						"completePath": "elements/Material-UI/typography.tpl",
						"children": [{
							"path": "text.tpl",
							"completePath": "elements/Basic/text.tpl",
							"type": "element",
							"icon": "ico-text",
							"helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
							"sourceType": "javascript",
							"options": [{
									"name": "Content",
									"display": "Content",
									"type": "text",
									"options": ""
								},
								{
									"name": "ClassName",
									"display": "ClassName",
									"type": "text",
									"options": ""
								}
							],
							"children": [],
							"open": false,
							"name": "Text Content",
							"cascades": false,
							"value": "text",
							"values": {
								"Content": "{aboutBody}"
							},
							"prevent_delete": false
						}],
						"icon": "ico-typography",
						"helpText": "Renders different typographic html elements",
						"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
						"options": [{
							"name": "tag",
							"display": "Tag",
							"type": "dropdown",
							"options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
						}],
						"childs": [{
							"name": "Text Content",
							"element": "text"
						}],
						"open": false,
						"name": "typography",
						"originalName": "typography",
						"cascades": false,
						"type": "element",
						"value": "typography",
						"values": {
							"tag": "body1"
						},
						"prevent_delete": false
					},
					{
						"path": "typography.tpl",
						"completePath": "elements/Material-UI/typography.tpl",
						"children": [{
							"path": "text.tpl",
							"completePath": "elements/Basic/text.tpl",
							"type": "element",
							"icon": "ico-text",
							"helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
							"sourceType": "javascript",
							"options": [{
									"name": "Content",
									"display": "Content",
									"type": "text",
									"options": ""
								},
								{
									"name": "ClassName",
									"display": "ClassName",
									"type": "text",
									"options": ""
								}
							],
							"children": [],
							"open": false,
							"name": "Text Content",
							"cascades": false,
							"value": "text",
							"values": {
								"Content": "{aboutSocials}"
							},
							"prevent_delete": false
						}],
						"icon": "ico-typography",
						"helpText": "Renders different typographic html elements",
						"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
						"options": [{
							"name": "tag",
							"display": "Tag",
							"type": "dropdown",
							"options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
						}],
						"childs": [{
							"name": "Text Content",
							"element": "text"
						}],
						"open": false,
						"name": "typography",
						"originalName": "typography",
						"cascades": false,
						"type": "element",
						"value": "typography",
						"values": {
							"tag": "h3"
						},
						"prevent_delete": false
					}
				],
				"options": [{
						"name": "container",
						"display": "Is the container",
						"type": "checkbox",
						"options": ""
					},
					{
						"name": "className",
						"display": "ClassName",
						"type": "text",
						"options": ""
					},
					{
						"name": "justify",
						"display": "Justify",
						"type": "dropdown",
						"options": "flex-start;center;flex-end;space-between;space-around;space-evenly"
					},
					{
						"name": "align",
						"display": "Align",
						"type": "dropdown",
						"options": "flex-start;center;flex-end;stretch;baseline"
					},
					{
						"name": "smallcolumns",
						"display": "Columns (small)",
						"type": "text",
						"options": "flex-start;center;flex-end;stretch;baseline"
					},
					{
						"name": "midcolumns",
						"display": "Columns (mid)",
						"type": "text",
						"options": "flex-start;center;flex-end;stretch;baseline"
					},
					{
						"name": "spacing",
						"display": "Spacing",
						"type": "text",
						"options": "flex-start;center;flex-end;stretch;baseline"
					}
				],
				"helpText": "The Material Design responsive layout grid adapts to screen size and orientation, ensuring consistency across layouts.",
				"icon": "ico-grid",
				"open": false,
				"name": "Left Grid",
				"cascades": false,
				"type": "element",
				"value": "grid",
				"values": {
					"smallcolumns": "12",
					"midcolumns": "6"
				},
				"prevent_delete": false
			},
			{
				"path": "grid.tpl",
				"completePath": "elements/Material-UI/grid.tpl",
				"children": [{
					"path": "image.tpl",
					"completePath": "elements/Material-UI/image.tpl",
					"children": [],
					"icon": "ico-image",
					"helpText": "Easily use images from Assets or the web",
					"options": [{
							"name": "useAsset",
							"display": "Use an asset",
							"type": "dropdown",
							"options": "return [['none', 'none'], ...aptugo.assetUtils.images().map(image => [image.id, image.name])]"
						},
						{
							"name": "path",
							"display": "Image Path",
							"type": "text",
							"options": ""
						},
						{
							"name": "webppath",
							"display": "Image Path (WebP)",
							"type": "text",
							"options": "return aptugo.assetUtils.grabCssSelectors( aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )"
						},
						{
							"name": "className",
							"display": "ClassName",
							"type": "styles"
						},
						{
							"name": "alt",
							"display": "Alt Text",
							"type": "text",
							"options": "return aptugo.assetUtils.grabCssSelectors( aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )"
						},
						{
							"name": "width",
							"display": "Width",
							"type": "text",
							"options": "return aptugo.assetUtils.grabCssSelectors( aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )"
						},
						{
							"name": "height",
							"display": "Height",
							"type": "text",
							"options": "return aptugo.assetUtils.grabCssSelectors( aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )"
						},
						{
							"name": "onError",
							"display": "On Error",
							"type": "text",
							"advanced": true
						}
					],
					"open": false,
					"name": "image",
					"cascades": false,
					"type": "element",
					"value": "image",
					"values": {
						"className": "theme.aboutImage",
						"path": "{aboutImagePath}"
					},
					"prevent_delete": false
				}],
				"options": [{
						"name": "container",
						"display": "Is the container",
						"type": "checkbox",
						"options": ""
					},
					{
						"name": "className",
						"display": "ClassName",
						"type": "text",
						"options": ""
					},
					{
						"name": "justify",
						"display": "Justify",
						"type": "dropdown",
						"options": "flex-start;center;flex-end;space-between;space-around;space-evenly"
					},
					{
						"name": "align",
						"display": "Align",
						"type": "dropdown",
						"options": "flex-start;center;flex-end;stretch;baseline"
					},
					{
						"name": "smallcolumns",
						"display": "Columns (small)",
						"type": "text",
						"options": "flex-start;center;flex-end;stretch;baseline"
					},
					{
						"name": "midcolumns",
						"display": "Columns (mid)",
						"type": "text",
						"options": "flex-start;center;flex-end;stretch;baseline"
					},
					{
						"name": "spacing",
						"display": "Spacing",
						"type": "text",
						"options": "flex-start;center;flex-end;stretch;baseline"
					}
				],
				"helpText": "The Material Design responsive layout grid adapts to screen size and orientation, ensuring consistency across layouts.",
				"icon": "ico-grid",
				"open": false,
				"name": "Right Grid",
				"cascades": false,
				"type": "element",
				"value": "grid",
				"values": {
					"smallcolumns": "12",
					"midcolumns": "6"
				},
				"prevent_delete": false
			}
		],
		"options": [{
				"name": "container",
				"display": "Is the container",
				"type": "checkbox",
				"options": ""
			},
			{
				"name": "className",
				"display": "ClassName",
				"type": "text",
				"options": ""
			},
			{
				"name": "justify",
				"display": "Justify",
				"type": "dropdown",
				"options": "flex-start;center;flex-end;space-between;space-around;space-evenly"
			},
			{
				"name": "align",
				"display": "Align",
				"type": "dropdown",
				"options": "flex-start;center;flex-end;stretch;baseline"
			},
			{
				"name": "smallcolumns",
				"display": "Columns (small)",
				"type": "text",
				"options": "flex-start;center;flex-end;stretch;baseline"
			},
			{
				"name": "midcolumns",
				"display": "Columns (mid)",
				"type": "text",
				"options": "flex-start;center;flex-end;stretch;baseline"
			},
			{
				"name": "spacing",
				"display": "Spacing",
				"type": "text",
				"options": "flex-start;center;flex-end;stretch;baseline"
			}
		],
		"helpText": "The Material Design responsive layout grid adapts to screen size and orientation, ensuring consistency across layouts.",
		"icon": "ico-grid",
		"open": false,
		"name": "Grid",
		"cascades": false,
		"type": "element",
		"value": "grid",
		"values": {
			"container": true
		},
		"prevent_delete": false
	}],
	"open": false,
	"name": "Container",
	"cascades": false,
	"value": "Container",
	"values": {
		"maxWidth": "lg",
		"className": "theme.aboutUs"
	},
	"prevent_delete": false
}
  
  if (!aptugo.findPageInTree) aptugo.findPageInTree = aptugo.pageUtils.findPageInTree
  
  const containerPage = aptugo.findPageInTree(Application.pages, Parameters.parentPage)
  
  const containerHead = containerPage.children.find(child => child.value === 'ph')
  if (containerHead) {
    if (!containerHead.children) containerHead.children = []
    containerHead.children.push(PH)
  }
  
  const containerBody = containerPage.children.find(child => child.value === 'b')
  if (containerBody) {
    if (!containerBody.children) containerBody.children = []
    containerBody.children.push(B)
  }
  
  return Application