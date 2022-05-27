const dashboardID = aptugo.generateID()

const bpr = {
	"name": "Before Page Render",
	"path": "bpr.tpl",
	"completePath": "elements/Aptugo Internal Use/bpr.tpl",
	"cascades": false,
	"type": "element",
	"value": "bpr",
	"prevent_delete": false,
	"children": []
}

const appRootPH = {
	"name": "Page Header",
	"path": "ph.tpl",
	"completePath": "elements/Aptugo Internal Use/ph.tpl",
	"cascades": false,
	"type": "element",
	"value": "ph",
	"prevent_delete": false,
	"children": [{
		"name": "themeSelection",
		"path": "themeSelection.tpl",
		"completePath": "elements/Experimental/themeSelection.tpl",
		"cascades": true,
		"type": "element",
		"value": "themeSelection",
		"values": { "theme": "lite" },
		"prevent_delete": false,
		"children": []
	},{
					"children": [
							{
									"name": "SelectedLanguage",
									"path": "useState.tpl",
									"completePath": "elements/Programming/useState.tpl",
									"cascades": false,
									"type": "element",
									"value": "useState",
									"values": {
											"variableName": "langselected",
											"defaultValue": "localStorage.getItem('aptugolang') || 'en'"
									},
									"prevent_delete": false,
									"children": []
							},
							{
									"name": "Language",
									"path": "useState.tpl",
									"completePath": "elements/Programming/useState.tpl",
									"cascades": false,
									"type": "element",
									"value": "useState",
									"values": {
											"variableName": "lang",
											"defaultValue": "{}"
									},
									"prevent_delete": false,
									"children": []
							},
							{
									"children": [
											{
													"children": [
															{
																	"name": "updateStateVariable",
																	"path": "updateStateVariable.tpl",
																	"completePath": "elements/Programming/Snippets/updateStateVariable.tpl",
																	"cascades": false,
																	"type": "element",
																	"value": "updateStateVariable",
																	"values": {
																			"variable": "lang",
																			"newvalue": "langStrings[langselected]"
																	},
																	"prevent_delete": false,
																	"children": []
															}
													],
													"name": "Lang Strings Exist?",
													"path": "condition.tpl",
													"completePath": "elements/Programming/condition.tpl",
													"cascades": false,
													"type": "element",
													"value": "condition",
													"values": {
															"condition": "typeof langStrings !== 'undefined'",
															"useInCode": true
													},
													"prevent_delete": false
											}
									],
									"name": "onPageLoad",
									"path": "onPageLoad.tpl",
									"completePath": "elements/Programming/onPageLoad.tpl",
									"cascades": false,
									"type": "element",
									"value": "onPageLoad",
									"prevent_delete": false
							}
					],
					"name": "Language",
					"path": "dummyEncloser.tpl",
					"completePath": "elements/Basic/dummyEncloser.tpl",
					"cascades": true,
					"type": "element",
					"value": "dummyEncloser",
					"prevent_delete": false
			
				}],
}

const b = {
	"name": "Body",
	"path": "b.tpl",
	"completePath": "elements/Aptugo Internal Use/b.tpl",
	"cascades": false,
	"type": "element",
	"value": "b",
	"prevent_delete": false,
	"children": []
}

const pf = {
	"name": "Page Footer",
	"path": "pf.tpl",
	"completePath": "elements/Aptugo Internal Use/pf.tpl",
	"cascades": false,
	"type": "element",
	"value": "pf",
	"prevent_delete": false,
	"children": []
}

const apr = {
	"name": "After Page Render",
	"path": "apr.tpl",
	"completePath": "elements/Aptugo Internal Use/apr.tpl",
	"cascades": false,
	"type": "element",
	"value": "apr",
	"prevent_delete": false,
	"children": []
}

const dashboard = {
	"name": "Dashboard",
	"type": "page",
	"path": "/",
	"filename": "dashboard.tsx",
	"prevent_delete": false,
	"children": [
			bpr,
			{
					"path": "ph.tpl",
					"completePath": "elements/Aptugo Internal Use/ph.tpl",
					"open": false,
					"children": [
							{
									"path": "dummyEncloser.tpl",
									"completePath": "elements/Basic/dummyEncloser.tpl",
									"children": [
											{
													"path": "defineVariable.tpl",
													"completePath": "elements/Programming/defineVariable.tpl",
													"type": "element",
													"icon": "ico-define-variable",
													"helpText": "Allows you to define a variable that will be used later",
													"options": [
															{
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
													"settings": [
															{
																	"name": "ServerAddenum",
																	"value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
															}
													],
													"sourceType": "javascript",
													"children": [],
													"open": false,
													"name": "Image: CompanyLogo",
													"cascades": false,
													"value": "defineVariable",
													"values": {
															"variableName": "companyLogo",
															"variableValue": "\"/img/cofelogo.png\""
													},
													"prevent_delete": false
											},
											{
													"path": "defineVariable.tpl",
													"completePath": "elements/Programming/defineVariable.tpl",
													"type": "element",
													"icon": "ico-define-variable",
													"helpText": "Allows you to define a variable that will be used later",
													"options": [
															{
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
													"settings": [
															{
																	"name": "ServerAddenum",
																	"value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
															}
													],
													"sourceType": "javascript",
													"children": [],
													"open": false,
													"name": "Image: FooterCompanyLogo",
													"cascades": false,
													"value": "defineVariable",
													"values": {
															"variableName": "footercompanyLogo",
															"variableValue": "\"/img/cofelogo.png\""
													},
													"prevent_delete": false
											},
											{
													"path": "defineVariable.tpl",
													"completePath": "elements/Programming/defineVariable.tpl",
													"type": "element",
													"icon": "ico-define-variable",
													"helpText": "Allows you to define a variable that will be used later",
													"options": [
															{
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
													"settings": [
															{
																	"name": "ServerAddenum",
																	"value": "{% if element.values.serverSide %}\n  {% if element.values.willbeModified %}let{% else %}const{% endif %} {{ element.values.variableName }} = {{ element.values.variableValue|default(content | raw)}}\n{% endif %}"
															}
													],
													"sourceType": "javascript",
													"children": [],
													"open": false,
													"name": "Language",
													"cascades": false,
													"value": "defineVariable",
													"values": {
															"variableName": "langStrings",
															"variableValue": "{\n    en: {\n      navbartext: \"Your Phone Number\",\n      copy: \"Copyright © 2022 coffeemine Ltd. All rights reserved.\"\n    },\n    sp: {\n      navbartext: \"Tu número telefónico\",\n      copy: \"Copyright © 2022 coffeemine Ltd. Todos los derechos reservados.\"\n    },\n  }"
													},
													"prevent_delete": false
											}
									],
									"icon": "ico-dummy-enclosure",
									"helpText": "Organizational unit with no render value",
									"options": [
											{
													"name": "titleAsComment",
													"display": "Use Name as Comment",
													"type": "checkbox",
													"options": ""
											}
									],
									"open": false,
									"name": "Config: NavBar",
									"cascades": false,
									"type": "element",
									"value": "dummyEncloser",
									"values": {
											"titleAsComment": true
									},
									"prevent_delete": false
							},
							{
									"path": "dummyEncloser.tpl",
									"completePath": "elements/Basic/dummyEncloser.tpl",
									"children": [
											{
													"path": "useState.tpl",
													"completePath": "elements/Programming/useState.tpl",
													"type": "element",
													"icon": "ico-use-state",
													"options": [
															{
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
													"name": "Top Menu Items",
													"cascades": false,
													"value": "useState",
													"values": {
															"variableName": "topMenuItems",
															"defaultValue": "[]"
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
													"children": [
															{
																	"path": "updateStateVariable.tpl",
																	"completePath": "elements/Programming/Snippets/updateStateVariable.tpl",
																	"type": "element",
																	"icon": "ico-paper",
																	"sourceType": "javascript",
																	"helpText": "Updates the value of a state variable",
																	"options": [
																			{
																					"name": "variable",
																					"display": "Variable to Update",
																					"type": "variable",
																					"options": ""
																			},
																			{
																					"name": "newvalue",
																					"display": "New Value",
																					"type": "variable",
																					"options": ""
																			}
																	],
																	"children": [],
																	"open": false,
																	"name": "Update Top Menu Items",
																	"cascades": false,
																	"value": "updateStateVariable",
																	"values": {
																			"variable": "topMenuItems",
																			"newvalue": "[...document.querySelectorAll('#app div[id]')].map(actdiv => { return { link: actdiv.id, title: actdiv.title } })"
																	},
																	"prevent_delete": false
															}
													],
													"name": "onPageLoad",
													"cascades": false,
													"value": "onPageLoad",
													"prevent_delete": false
											}
									],
									"icon": "ico-dummy-enclosure",
									"helpText": "Organizational unit with no render value",
									"options": [
											{
													"name": "titleAsComment",
													"display": "Use Name as Comment",
													"type": "checkbox",
													"options": ""
											}
									],
									"open": false,
									"name": "Definitions: NavBar",
									"cascades": false,
									"type": "element",
									"value": "dummyEncloser",
									"values": {
											"titleAsComment": true
									},
									"prevent_delete": false
							}
					],
					"name": "Page Header",
					"cascades": false,
					"type": "element",
					"value": "ph",
					"prevent_delete": false
			},
			{
					"path": "b.tpl",
					"completePath": "elements/Aptugo Internal Use/b.tpl",
					"type": "element",
					"icon": "ico-field",
					"sourceType": "javascript",
					"internalUse": true,
					"children": [
							{
									"path": "navbar.tpl",
									"completePath": "elements/Material-UI/navbar.tpl",
									"type": "element",
									"icon": "ico-nav-bar",
									"helpText": "Navigation bar component",
									"options": [
											{
													"name": "Title",
													"display": "Title",
													"type": "text",
													"options": ""
											},
											{
													"name": "Color",
													"display": "Color",
													"type": "dropdown",
													"options": "default;inherit;primary;secondary;transparent"
											},
											{
													"name": "Position",
													"display": "Position",
													"type": "dropdown",
													"options": "absolute;fixed;relative;static;sticky"
											},
											{
													"name": "ClassName",
													"display": "ClassName",
													"type": "text",
													"options": ""
											},
											{
													"name": "Elevation",
													"display": "Elevation",
													"type": "dropdown",
													"options": "0;1;2;3;4;5"
											}
									],
									"sourceType": "javascript",
									"children": [
											{
													"path": "Container.tpl",
													"completePath": "elements/Material-UI/Container.tpl",
													"type": "element",
													"icon": "ico-field",
													"helpText": "The container centers your content horizontally. It's the most basic layout element.",
													"options": [
															{
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
													"children": [
															{
																	"path": "div.tpl",
																	"completePath": "elements/Basic/div.tpl",
																	"type": "element",
																	"icon": "ico-div",
																	"sourceType": "javascript",
																	"options": [
																			{
																					"name": "class",
																					"display": "ClassName",
																					"type": "styles",
																					"options": ""
																			},
																			{
																					"name": "useid",
																					"display": "Use UniqueID as ID",
																					"type": "checkbox",
																					"options": ""
																			},
																			{
																					"name": "id",
																					"display": "ID",
																					"type": "text",
																					"options": ""
																			},
																			{
																					"name": "onclick",
																					"display": "On Click",
																					"type": "function",
																					"options": ""
																			},
																			{
																					"name": "ref",
																					"display": "Use Reference",
																					"type": "text",
																					"options": ""
																			},
																			{
																					"name": "style",
																					"display": "Extra Styles",
																					"type": "text",
																					"options": ""
																			}
																	],
																	"children": [
																			{
																					"path": "image.tpl",
																					"completePath": "elements/Material-UI/image.tpl",
																					"children": [],
																					"icon": "ico-image",
																					"helpText": "Easily use images from Assets or the web",
																					"options": [
																							{
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
																					"name": "Logo",
																					"cascades": false,
																					"type": "element",
																					"value": "image",
																					"values": {
																							"useAsset": "none",
																							"width": "",
																							"height": "51",
																							"path": "{companyLogo}"
																					},
																					"prevent_delete": false
																			},
																			{
																					"path": "Box.tpl",
																					"completePath": "elements/Material-UI/Box.tpl",
																					"type": "element",
																					"icon": "ico-box",
																					"helpText": "The Box component serves as a wrapper component for most of the CSS utility needs.",
																					"sourceType": "javascript",
																					"options": [
																							{
																									"name": "color",
																									"display": "Color",
																									"type": "dropdown",
																									"options": "common.black;common.white;primary.main;primary.light;primary.dark;primary.contrastText;secondary.main;secondary.light;secondary.dark;secondary.contrastText;error.main;error.light;error.dark;error.contrastText;warning.main;warning.light;warning.dark;warning.contrastText;info.main;info.light;info.dark;info.contrastText;succcess.main;succcess.light;succcess.dark;succcess.contrastText"
																							},
																							{
																									"name": "xsdisplay",
																									"display": "Extra Small",
																									"type": "dropdown",
																									"options": "unset;block;none;flex"
																							},
																							{
																									"name": "mddisplay",
																									"display": "Mid Size",
																									"type": "dropdown",
																									"options": "unset;block;none;flex"
																							},
																							{
																									"name": "justifyContent",
																									"display": "Justify Content",
																									"type": "dropdown",
																									"options": "unset;flex-start;flex-end;center;space-between;space-around;space-evenly"
																							}
																					],
																					"children": [
																							{
																									"path": "IconButton.tpl",
																									"completePath": "elements/Material-UI/IconButton.tpl",
																									"type": "element",
																									"icon": "ico-icon-button",
																									"options": [
																											{
																													"name": "Action",
																													"display": "Action",
																													"type": "text",
																													"options": ""
																											},
																											{
																													"name": "Color",
																													"display": "Color",
																													"type": "dropdown",
																													"options": "default;inherit;primary;secondary;error;info;success;warning",
																													"settings": {
																															"default": "primary"
																													}
																											},
																											{
																													"name": "className",
																													"display": "ClassName",
																													"type": "text",
																													"options": ""
																											},
																											{
																													"name": "icon",
																													"display": "Icon",
																													"type": "dropdown",
																													"options": "None;AcUnit;Add;AddShoppingCart;CallMade;HelpOutline;Home;Link;MoreVert;Send;ShoppingBasket;ShoppingCart;SportsBasketball;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp"
																											},
																											{
																													"name": "iconstyle",
																													"display": "Icon Style",
																													"type": "dropdown",
																													"options": "Filled;Outlined;Rounded;TwoTone;Sharp"
																											}
																									],
																									"sourceType": "javascript",
																									"children": [],
																									"open": false,
																									"name": "IconButton",
																									"cascades": false,
																									"value": "IconButton",
																									"values": {
																											"Action": "(e) => { setAnchorEl(e.currentTarget) }",
																											"icon": "Menu",
																											"iconstyle": "Filled",
																											"Color": "inherit"
																									},
																									"prevent_delete": false
																							},
																							{
																									"path": "Menu.tpl",
																									"completePath": "elements/Material-UI/Menu/Menu.tpl",
																									"type": "element",
																									"icon": "ico-menu",
																									"children": [
																											{
																													"path": "MenuItem.tpl",
																													"completePath": "elements/Material-UI/Menu/MenuItem.tpl",
																													"type": "element",
																													"icon": "file.svg",
																													"helpText": "Adds a menu item into a menu",
																													"options": [
																															{
																																	"name": "onclick",
																																	"display": "On Click",
																																	"type": "text",
																																	"options": ""
																															}
																													],
																													"open": false,
																													"children": [
																															{
																																	"path": "text.tpl",
																																	"completePath": "elements/Basic/text.tpl",
																																	"type": "element",
																																	"icon": "ico-text",
																																	"helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
																																	"sourceType": "javascript",
																																	"options": [
																																			{
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
																																	"name": "text",
																																	"cascades": false,
																																	"value": "text",
																																	"values": {
																																			"Content": "hola"
																																	},
																																	"prevent_delete": false
																															}
																													],
																													"name": "MenuItem",
																													"cascades": false,
																													"value": "MenuItem",
																													"prevent_delete": false
																											},
																											{
																													"path": "div.tpl",
																													"completePath": "elements/Basic/div.tpl",
																													"type": "element",
																													"icon": "ico-div",
																													"sourceType": "javascript",
																													"options": [
																															{
																																	"name": "class",
																																	"display": "ClassName",
																																	"type": "styles",
																																	"options": ""
																															},
																															{
																																	"name": "useid",
																																	"display": "Use UniqueID as ID",
																																	"type": "checkbox",
																																	"options": ""
																															},
																															{
																																	"name": "id",
																																	"display": "ID",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "onclick",
																																	"display": "On Click",
																																	"type": "function",
																																	"options": ""
																															},
																															{
																																	"name": "ref",
																																	"display": "Use Reference",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "style",
																																	"display": "Extra Styles",
																																	"type": "text",
																																	"options": ""
																															}
																													],
																													"children": [
																															{
																																	"path": "typography.tpl",
																																	"completePath": "elements/Material-UI/typography.tpl",
																																	"children": [
																																			{
																																					"path": "text.tpl",
																																					"completePath": "elements/Basic/text.tpl",
																																					"type": "element",
																																					"icon": "ico-text",
																																					"helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
																																					"sourceType": "javascript",
																																					"options": [
																																							{
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
																																					"name": "NavBarText",
																																					"cascades": false,
																																					"value": "text",
																																					"values": {
																																							"Content": "{lang?.navbartext}"
																																					},
																																					"prevent_delete": false
																																			}
																																	],
																																	"icon": "ico-typography",
																																	"helpText": "Renders different typographic html elements",
																																	"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
																																	"options": [
																																			{
																																					"name": "tag",
																																					"display": "Tag",
																																					"type": "dropdown",
																																					"options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
																																			}
																																	],
																																	"childs": [
																																			{
																																					"name": "Text Content",
																																					"element": "text"
																																			}
																																	],
																																	"open": false,
																																	"name": "typography",
																																	"cascades": false,
																																	"type": "element",
																																	"value": "typography",
																																	"values": {
																																			"tag": "body2"
																																	},
																																	"prevent_delete": false
																															}
																													],
																													"helpText": "Basic HTML Div element",
																													"open": false,
																													"name": "NavBarText",
																													"cascades": false,
																													"value": "div",
																													"values": {
																															"class": "theme.navBarText"
																													},
																													"prevent_delete": false
																											},
																											{
																													"path": "div.tpl",
																													"completePath": "elements/Basic/div.tpl",
																													"type": "element",
																													"icon": "ico-div",
																													"sourceType": "javascript",
																													"options": [
																															{
																																	"name": "class",
																																	"display": "ClassName",
																																	"type": "styles",
																																	"options": ""
																															},
																															{
																																	"name": "useid",
																																	"display": "Use UniqueID as ID",
																																	"type": "checkbox",
																																	"options": ""
																															},
																															{
																																	"name": "id",
																																	"display": "ID",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "onclick",
																																	"display": "On Click",
																																	"type": "function",
																																	"options": ""
																															},
																															{
																																	"name": "ref",
																																	"display": "Use Reference",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "style",
																																	"display": "Extra Styles",
																																	"type": "text",
																																	"options": ""
																															}
																													],
																													"children": [
																															{
																																	"path": "button.tpl",
																																	"completePath": "elements/Material-UI/button.tpl",
																																	"type": "element",
																																	"icon": "ico-button",
																																	"options": [
																																			{
																																					"name": "ButtonText",
																																					"display": "Button Text",
																																					"type": "text",
																																					"options": "",
																																					"settings": {
																																							"default": "Button"
																																					}
																																			},
																																			{
																																					"name": "Action",
																																					"display": "Action",
																																					"type": "text",
																																					"options": ""
																																			},
																																			{
																																					"name": "className",
																																					"display": "ClassName",
																																					"type": "text",
																																					"options": ""
																																			},
																																			{
																																					"name": "Variant",
																																					"display": "Variant",
																																					"type": "dropdown",
																																					"options": "text;contained;outlined"
																																			},
																																			{
																																					"name": "Color",
																																					"display": "Color",
																																					"type": "dropdown",
																																					"options": "default;inherit;primary;secondary",
																																					"settings": {
																																							"default": "primary"
																																					}
																																			},
																																			{
																																					"name": "disabled",
																																					"display": "Disabled",
																																					"type": "variable",
																																					"options": "",
																																					"settings": {
																																							"active": true
																																					}
																																			},
																																			{
																																					"name": "fullWidth",
																																					"display": "Full Width",
																																					"type": "checkbox",
																																					"options": ""
																																			},
																																			{
																																					"name": "icon",
																																					"display": "Icon",
																																					"type": "dropdown",
																																					"options": "None;Add;Home;Link;Send;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp"
																																			}
																																	],
																																	"sourceType": "javascript",
																																	"children": [],
																																	"open": false,
																																	"name": "Español",
																																	"cascades": false,
																																	"value": "button",
																																	"values": {
																																			"ButtonText": "🇪🇸 Esp",
																																			"Color": "inherit",
																																			"Action": "setlangselected('sp')\nsetlang(langStrings['sp'])",
																																			"className": "`${theme.languageButton} ${langselected === 'sp' && theme.selected}`"
																																	},
																																	"prevent_delete": false
																															},
																															{
																																	"path": "button.tpl",
																																	"completePath": "elements/Material-UI/button.tpl",
																																	"type": "element",
																																	"icon": "ico-button",
																																	"options": [
																																			{
																																					"name": "ButtonText",
																																					"display": "Button Text",
																																					"type": "text",
																																					"options": "",
																																					"settings": {
																																							"default": "Button"
																																					}
																																			},
																																			{
																																					"name": "Action",
																																					"display": "Action",
																																					"type": "text",
																																					"options": ""
																																			},
																																			{
																																					"name": "className",
																																					"display": "ClassName",
																																					"type": "text",
																																					"options": ""
																																			},
																																			{
																																					"name": "Variant",
																																					"display": "Variant",
																																					"type": "dropdown",
																																					"options": "text;contained;outlined"
																																			},
																																			{
																																					"name": "Color",
																																					"display": "Color",
																																					"type": "dropdown",
																																					"options": "default;inherit;primary;secondary",
																																					"settings": {
																																							"default": "primary"
																																					}
																																			},
																																			{
																																					"name": "disabled",
																																					"display": "Disabled",
																																					"type": "variable",
																																					"options": "",
																																					"settings": {
																																							"active": true
																																					}
																																			},
																																			{
																																					"name": "fullWidth",
																																					"display": "Full Width",
																																					"type": "checkbox",
																																					"options": ""
																																			},
																																			{
																																					"name": "icon",
																																					"display": "Icon",
																																					"type": "dropdown",
																																					"options": "None;Add;Home;Link;Send;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp"
																																			}
																																	],
																																	"sourceType": "javascript",
																																	"children": [],
																																	"open": false,
																																	"name": "English",
																																	"cascades": false,
																																	"value": "button",
																																	"values": {
																																			"ButtonText": "🇬🇧 Eng",
																																			"Color": "inherit",
																																			"Action": "setlangselected('en')\nsetlang(langStrings['en'])",
																																			"className": "`${theme.languageButton} ${langselected === 'en' && theme.selected}`"
																																	},
																																	"prevent_delete": false
																															}
																													],
																													"helpText": "Basic HTML Div element",
																													"open": false,
																													"name": "Language Buttons",
																													"cascades": false,
																													"value": "div",
																													"values": {
																															"class": "theme.languageButtons"
																													},
																													"prevent_delete": false
																											}
																									],
																									"options": [
																											{
																													"name": "anchorElement",
																													"display": "Anchor Element",
																													"type": "text",
																													"options": ""
																											},
																											{
																													"name": "onClose",
																													"display": "On Close",
																													"type": "text",
																													"options": ""
																											}
																									],
																									"helpText": "Menus display a list of choices on temporary surfaces.",
																									"open": false,
																									"name": "Menu",
																									"cascades": false,
																									"value": "Menu",
																									"prevent_delete": false
																							}
																					],
																					"open": false,
																					"name": "Menu Box (mobile)",
																					"cascades": false,
																					"value": "Box",
																					"values": {
																							"xsdisplay": "flex",
																							"mddisplay": "none",
																							"color": "common.black"
																					},
																					"prevent_delete": false
																			},
																			{
																					"path": "Box.tpl",
																					"completePath": "elements/Material-UI/Box.tpl",
																					"type": "element",
																					"icon": "ico-box",
																					"helpText": "The Box component serves as a wrapper component for most of the CSS utility needs.",
																					"sourceType": "javascript",
																					"options": [
																							{
																									"name": "color",
																									"display": "Color",
																									"type": "dropdown",
																									"options": "common.black;common.white;primary.main;primary.light;primary.dark;primary.contrastText;secondary.main;secondary.light;secondary.dark;secondary.contrastText;error.main;error.light;error.dark;error.contrastText;warning.main;warning.light;warning.dark;warning.contrastText;info.main;info.light;info.dark;info.contrastText;succcess.main;succcess.light;succcess.dark;succcess.contrastText"
																							},
																							{
																									"name": "xsdisplay",
																									"display": "Extra Small",
																									"type": "dropdown",
																									"options": "unset;block;none;flex"
																							},
																							{
																									"name": "mddisplay",
																									"display": "Mid Size",
																									"type": "dropdown",
																									"options": "unset;block;none;flex"
																							},
																							{
																									"name": "justifyContent",
																									"display": "Justify Content",
																									"type": "dropdown",
																									"options": "unset;flex-start;flex-end;center;space-between;space-around;space-evenly"
																							}
																					],
																					"children": [
																							{
																									"path": "loop.tpl",
																									"completePath": "elements/Programming/loop.tpl",
																									"type": "element",
																									"icon": "ico-loop",
																									"sourceType": "javascript",
																									"helpText": "Allows you to loop a variable and render child elements",
																									"options": [
																											{
																													"name": "variable",
																													"display": "Source Variable",
																													"type": "variable",
																													"options": "",
																													"settings": {
																															"aptugoOnLoad": "const allVariables = aptugo.variables.variables\nconst element = arguments[0];\nconst page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;\nconst usesVariable = element.values.variable\nconst newLocalVarName = element.values.variablename || 'item'\nconst foundVariable = allVariables.find(thevar => thevar.name === usesVariable)\nfinalVarsToAdd = { [newLocalVarName]: foundVariable ? foundVariable.value : ''}\naptugo.variables.setElementVariable(element.unique_id, finalVarsToAdd);",
																															"active": true
																													}
																											},
																											{
																													"name": "variablename",
																													"display": "Variable name in which each item will be put in",
																													"type": "text",
																													"settings": {
																															"default": "item"
																													}
																											},
																											{
																													"name": "filtersource",
																													"display": "Condition to filter source values",
																													"type": "text",
																													"advanced": true
																											},
																											{
																													"name": "code",
																													"display": "Code",
																													"type": "text",
																													"options": ""
																											}
																									],
																									"children": [
																											{
																													"path": "simpleLink.tpl",
																													"completePath": "elements/Material-UI/simpleLink.tpl",
																													"type": "element",
																													"icon": "ico-link",
																													"options": [
																															{
																																	"name": "destination",
																																	"display": "Destination",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "tagToUse",
																																	"display": "Use Tag",
																																	"type": "dropdown",
																																	"options": "NavLink;A"
																															},
																															{
																																	"name": "className",
																																	"display": "ClassName",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "style",
																																	"display": "Extra Styles",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "target",
																																	"display": "Link Target",
																																	"type": "dropdown",
																																	"options": "_self;_blank;_parent;_top"
																															}
																													],
																													"sourceType": "javascript",
																													"children": [
																															{
																																	"path": "button.tpl",
																																	"completePath": "elements/Material-UI/button.tpl",
																																	"type": "element",
																																	"icon": "ico-button",
																																	"options": [
																																			{
																																					"name": "ButtonText",
																																					"display": "Button Text",
																																					"type": "text",
																																					"options": "",
																																					"settings": {
																																							"default": "Button"
																																					}
																																			},
																																			{
																																					"name": "Action",
																																					"display": "Action",
																																					"type": "text",
																																					"options": ""
																																			},
																																			{
																																					"name": "className",
																																					"display": "ClassName",
																																					"type": "text",
																																					"options": ""
																																			},
																																			{
																																					"name": "Variant",
																																					"display": "Variant",
																																					"type": "dropdown",
																																					"options": "text;contained;outlined"
																																			},
																																			{
																																					"name": "Color",
																																					"display": "Color",
																																					"type": "dropdown",
																																					"options": "default;inherit;primary;secondary",
																																					"settings": {
																																							"default": "primary"
																																					}
																																			},
																																			{
																																					"name": "disabled",
																																					"display": "Disabled",
																																					"type": "variable",
																																					"options": "",
																																					"settings": {
																																							"active": true
																																					}
																																			},
																																			{
																																					"name": "fullWidth",
																																					"display": "Full Width",
																																					"type": "checkbox",
																																					"options": ""
																																			},
																																			{
																																					"name": "icon",
																																					"display": "Icon",
																																					"type": "dropdown",
																																					"options": "None;Add;Home;Link;Send;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp"
																																			}
																																	],
																																	"sourceType": "javascript",
																																	"children": [],
																																	"open": false,
																																	"name": "button",
																																	"cascades": false,
																																	"value": "button",
																																	"values": {
																																			"ButtonText": "{topMenuItem.title}",
																																			"Color": "inherit"
																																	},
																																	"prevent_delete": false
																															}
																													],
																													"open": false,
																													"name": "simpleLink",
																													"cascades": false,
																													"value": "simpleLink",
																													"values": {
																															"destination": "#${topMenuItem.link}",
																															"tagToUse": "A",
																															"className": "`${theme.navButton} ${location.hash === '#' + topMenuItem.link && theme.selected}`"
																													},
																													"prevent_delete": false
																											}
																									],
																									"open": false,
																									"name": "Navigation Buttons",
																									"cascades": false,
																									"value": "loop",
																									"values": {
																											"variable": "topMenuItems",
																											"variablename": "topMenuItem"
																									},
																									"prevent_delete": false
																							},
																							{
																									"path": "div.tpl",
																									"completePath": "elements/Basic/div.tpl",
																									"type": "element",
																									"icon": "ico-div",
																									"sourceType": "javascript",
																									"options": [
																											{
																													"name": "class",
																													"display": "ClassName",
																													"type": "styles",
																													"options": ""
																											},
																											{
																													"name": "useid",
																													"display": "Use UniqueID as ID",
																													"type": "checkbox",
																													"options": ""
																											},
																											{
																													"name": "id",
																													"display": "ID",
																													"type": "text",
																													"options": ""
																											},
																											{
																													"name": "onclick",
																													"display": "On Click",
																													"type": "function",
																													"options": ""
																											},
																											{
																													"name": "ref",
																													"display": "Use Reference",
																													"type": "text",
																													"options": ""
																											},
																											{
																													"name": "style",
																													"display": "Extra Styles",
																													"type": "text",
																													"options": ""
																											}
																									],
																									"children": [
																											{
																													"path": "typography.tpl",
																													"completePath": "elements/Material-UI/typography.tpl",
																													"children": [
																															{
																																	"path": "text.tpl",
																																	"completePath": "elements/Basic/text.tpl",
																																	"type": "element",
																																	"icon": "ico-text",
																																	"helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
																																	"sourceType": "javascript",
																																	"options": [
																																			{
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
																																	"name": "NavBarText",
																																	"cascades": false,
																																	"value": "text",
																																	"values": {
																																			"Content": "{lang?.navbartext}"
																																	},
																																	"prevent_delete": false
																															}
																													],
																													"icon": "ico-typography",
																													"helpText": "Renders different typographic html elements",
																													"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
																													"options": [
																															{
																																	"name": "tag",
																																	"display": "Tag",
																																	"type": "dropdown",
																																	"options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
																															}
																													],
																													"childs": [
																															{
																																	"name": "Text Content",
																																	"element": "text"
																															}
																													],
																													"open": false,
																													"name": "typography",
																													"originalName": "typography",
																													"cascades": false,
																													"type": "element",
																													"value": "typography",
																													"values": {
																															"tag": "body2"
																													},
																													"prevent_delete": false
																											}
																									],
																									"helpText": "Basic HTML Div element",
																									"open": false,
																									"name": "NavBarText",
																									"cascades": false,
																									"value": "div",
																									"values": {
																											"class": "theme.navBarText"
																									},
																									"prevent_delete": false
																							},
																							{
																									"path": "div.tpl",
																									"completePath": "elements/Basic/div.tpl",
																									"type": "element",
																									"icon": "ico-div",
																									"sourceType": "javascript",
																									"options": [
																											{
																													"name": "class",
																													"display": "ClassName",
																													"type": "styles",
																													"options": ""
																											},
																											{
																													"name": "useid",
																													"display": "Use UniqueID as ID",
																													"type": "checkbox",
																													"options": ""
																											},
																											{
																													"name": "id",
																													"display": "ID",
																													"type": "text",
																													"options": ""
																											},
																											{
																													"name": "onclick",
																													"display": "On Click",
																													"type": "function",
																													"options": ""
																											},
																											{
																													"name": "ref",
																													"display": "Use Reference",
																													"type": "text",
																													"options": ""
																											},
																											{
																													"name": "style",
																													"display": "Extra Styles",
																													"type": "text",
																													"options": ""
																											}
																									],
																									"children": [
																											{
																													"path": "button.tpl",
																													"completePath": "elements/Material-UI/button.tpl",
																													"type": "element",
																													"icon": "ico-button",
																													"options": [
																															{
																																	"name": "ButtonText",
																																	"display": "Button Text",
																																	"type": "text",
																																	"options": "",
																																	"settings": {
																																			"default": "Button"
																																	}
																															},
																															{
																																	"name": "Action",
																																	"display": "Action",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "className",
																																	"display": "ClassName",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "Variant",
																																	"display": "Variant",
																																	"type": "dropdown",
																																	"options": "text;contained;outlined"
																															},
																															{
																																	"name": "Color",
																																	"display": "Color",
																																	"type": "dropdown",
																																	"options": "default;inherit;primary;secondary",
																																	"settings": {
																																			"default": "primary"
																																	}
																															},
																															{
																																	"name": "disabled",
																																	"display": "Disabled",
																																	"type": "variable",
																																	"options": "",
																																	"settings": {
																																			"active": true
																																	}
																															},
																															{
																																	"name": "fullWidth",
																																	"display": "Full Width",
																																	"type": "checkbox",
																																	"options": ""
																															},
																															{
																																	"name": "icon",
																																	"display": "Icon",
																																	"type": "dropdown",
																																	"options": "None;Add;Home;Link;Send;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp"
																															}
																													],
																													"sourceType": "javascript",
																													"children": [],
																													"open": false,
																													"name": "Español",
																													"cascades": false,
																													"value": "button",
																													"values": {
																															"ButtonText": "🇪🇸 Esp",
																															"Color": "inherit",
																															"Action": "setlangselected('sp')\nsetlang(langStrings['sp'])",
																															"className": "`${theme.languageButton} ${langselected === 'sp' && theme.selected}`"
																													},
																													"prevent_delete": false
																											},
																											{
																													"path": "button.tpl",
																													"completePath": "elements/Material-UI/button.tpl",
																													"type": "element",
																													"icon": "ico-button",
																													"options": [
																															{
																																	"name": "ButtonText",
																																	"display": "Button Text",
																																	"type": "text",
																																	"options": "",
																																	"settings": {
																																			"default": "Button"
																																	}
																															},
																															{
																																	"name": "Action",
																																	"display": "Action",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "className",
																																	"display": "ClassName",
																																	"type": "text",
																																	"options": ""
																															},
																															{
																																	"name": "Variant",
																																	"display": "Variant",
																																	"type": "dropdown",
																																	"options": "text;contained;outlined"
																															},
																															{
																																	"name": "Color",
																																	"display": "Color",
																																	"type": "dropdown",
																																	"options": "default;inherit;primary;secondary",
																																	"settings": {
																																			"default": "primary"
																																	}
																															},
																															{
																																	"name": "disabled",
																																	"display": "Disabled",
																																	"type": "variable",
																																	"options": "",
																																	"settings": {
																																			"active": true
																																	}
																															},
																															{
																																	"name": "fullWidth",
																																	"display": "Full Width",
																																	"type": "checkbox",
																																	"options": ""
																															},
																															{
																																	"name": "icon",
																																	"display": "Icon",
																																	"type": "dropdown",
																																	"options": "None;Add;Home;Link;Send;AllInbox;Menu;DeleteOutline;Favorite;Clear;Google;Facebook;Twitter;Person;ThumbUp"
																															}
																													],
																													"sourceType": "javascript",
																													"children": [],
																													"open": false,
																													"name": "English",
																													"cascades": false,
																													"value": "button",
																													"values": {
																															"ButtonText": "🇬🇧 Eng",
																															"Color": "inherit",
																															"Action": "setlangselected('en')\nsetlang(langStrings['en'])",
																															"className": "`${theme.languageButton} ${langselected === 'en' && theme.selected}`"
																													},
																													"prevent_delete": false
																											}
																									],
																									"helpText": "Basic HTML Div element",
																									"open": false,
																									"name": "Language Buttons",
																									"cascades": false,
																									"value": "div",
																									"values": {
																											"class": "theme.languageButtons"
																									},
																									"prevent_delete": false
																							}
																					],
																					"open": false,
																					"name": "Buttons Box (desktop)",
																					"cascades": false,
																					"value": "Box",
																					"values": {
																							"xsdisplay": "none",
																							"mddisplay": "flex",
																							"justifyContent": "flex-end",
																							"color": "common.black"
																					},
																					"prevent_delete": false
																			}
																	],
																	"helpText": "Basic HTML Div element",
																	"open": false,
																	"name": "div",
																	"cascades": false,
																	"value": "div",
																	"values": {
																			"class": "theme.navBarContainer"
																	},
																	"prevent_delete": false
															}
													],
													"open": false,
													"name": "Container",
													"cascades": false,
													"value": "Container",
													"values": {
															"maxWidth": "xl",
															"className": ""
													},
													"prevent_delete": false
											}
									],
									"open": false,
									"name": "Navigation Bar",
									"cascades": true,
									"value": "navbar",
									"values": {
											"Color": "default",
											"Position": "sticky"
									},
									"prevent_delete": false
							}
					],
					"options": [
							{
									"name": "className",
									"display": "ClassName",
									"type": "chips",
									"options": "return aptugo.assetUtils.grabCssSelectors( aptugo.variables.retrievePageVariablesFromElement(arguments[0],'theme') )"
							},
							{
									"name": "primaryColor",
									"display": "Primary Color",
									"type": "dropdown",
									"options": "red;pink;purple;deepPurple;indigo;blue;lightBlue;cyan;teal;green;lightGreen;lime;yellow;amber;orange;deepOrange;brown;grey;blueGrey"
							},
							{
									"name": "extraThemeOptions",
									"display": "Extra Theming options",
									"type": "text"
							}
					],
					"open": false,
					"name": "Body",
					"cascades": true,
					"value": "b",
					"values": {
							"className": [
									"theme.pages"
							],
							"primaryColor": "amber",
							"extraThemeOptions": "typography: {\n    fontFamily: 'Inter',\n    body2: {\n      fontWeight: 700,\n      color: '#A6ACBE',\n      fontSize: '15px',\n    },\n  },\n  components: {\n    MuiButton: {\n      styleOverrides: {\n        root: {\n          fontWeight: 700,\n        },\n      },\n    },\n  }"
					},
					"prevent_delete": false
			},
			{
					"path": "pf.tpl",
					"completePath": "elements/Aptugo Internal Use/pf.tpl",
					"open": false,
					"children": [
							{
									"path": "div.tpl",
									"completePath": "elements/Basic/div.tpl",
									"type": "element",
									"icon": "ico-div",
									"sourceType": "javascript",
									"options": [
											{
													"name": "class",
													"display": "ClassName",
													"type": "styles",
													"options": ""
											},
											{
													"name": "useid",
													"display": "Use UniqueID as ID",
													"type": "checkbox",
													"options": ""
											},
											{
													"name": "id",
													"display": "ID",
													"type": "text",
													"options": ""
											},
											{
													"name": "onclick",
													"display": "On Click",
													"type": "function",
													"options": ""
											},
											{
													"name": "ref",
													"display": "Use Reference",
													"type": "text",
													"options": ""
											},
											{
													"name": "style",
													"display": "Extra Styles",
													"type": "text",
													"options": ""
											}
									],
									"children": [
											{
													"path": "Container.tpl",
													"completePath": "elements/Material-UI/Container.tpl",
													"type": "element",
													"icon": "ico-field",
													"helpText": "The container centers your content horizontally. It's the most basic layout element.",
													"options": [
															{
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
													"children": [
															{
																	"path": "image.tpl",
																	"completePath": "elements/Material-UI/image.tpl",
																	"children": [],
																	"icon": "ico-image",
																	"helpText": "Easily use images from Assets or the web",
																	"options": [
																			{
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
																			"useAsset": "none",
																			"path": "{footercompanyLogo}"
																	},
																	"prevent_delete": false
															},
															{
																	"path": "typography.tpl",
																	"completePath": "elements/Material-UI/typography.tpl",
																	"children": [
																			{
																					"path": "text.tpl",
																					"completePath": "elements/Basic/text.tpl",
																					"type": "element",
																					"icon": "ico-text",
																					"helpText": "Insert simple text anywhere. Can hold variables, code, and anything of your choice",
																					"sourceType": "javascript",
																					"options": [
																							{
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
																							"Content": "{lang?.copy}"
																					},
																					"prevent_delete": false
																			}
																	],
																	"icon": "ico-typography",
																	"helpText": "Renders different typographic html elements",
																	"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
																	"options": [
																			{
																					"name": "tag",
																					"display": "Tag",
																					"type": "dropdown",
																					"options": "h1;h2;h3;h4;h5;h6;subtitle1;subtitle2;body1;body2;caption;button;overline;srOnly;inherit"
																			}
																	],
																	"childs": [
																			{
																					"name": "Text Content",
																					"element": "text"
																			}
																	],
																	"open": false,
																	"name": "typography",
																	"originalName": "typography",
																	"cascades": false,
																	"type": "element",
																	"value": "typography",
																	"values": {
																			"tag": "body2"
																	},
																	"prevent_delete": false
															}
													],
													"open": false,
													"name": "Container",
													"cascades": false,
													"value": "Container",
													"values": {
															"maxWidth": "xl"
													},
													"prevent_delete": false
											}
									],
									"helpText": "Basic HTML Div element",
									"open": false,
									"name": "Page Footer",
									"cascades": true,
									"value": "div",
									"values": {
											"class": "theme.pageFooter"
									},
									"prevent_delete": false
							}
					],
					"name": "Page Footer",
					"cascades": false,
					"type": "element",
					"value": "pf",
					"prevent_delete": false
			},
			apr
	],
}

const appRoot = {
	"name": "Application Root",
	"type": "page",
	"subtype": "cascade",
	"prevent_delete": true,
	"path": "",
	"children": [ bpr, appRootPH, b, pf, apr, dashboard ]
}

Application.pages = [appRoot]
Application.tables = []
Application.assets = []

return Application