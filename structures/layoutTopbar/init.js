const structID = aptugo.generateID()

const B = {
	"structure": structID,
	"structureId": "layoutTopbar",
	"structureName": "Header Two",
	"path": "dummyEncloser.tpl",
	"completePath": "elements/Basic/dummyEncloser.tpl",
	"children": [
		{
			"path": "component.tpl",
			"keyPath": "elements/Programming/component.tpl",
			"usesDelays": [
			  "bpr"
			],
			"delayContext": true,
			"extraFiles": [
			  {
				"source": "elements/Programming/baseComponent.tsx",
				"destination": "front-end/components/{{ element.values.name | friendly }}/index.tsx"
			  }
			],
			"name": "Topbar",
			"prevent_delete": false,
			"cascades": true,
			"children": [
			  {
				"name": "componentHeader",
				"type": "element",
				"value": "componentHeader",
				"children": [
				  {
					"name": "Current User",
					"value": "useState",
					"values": {
					  "defaultValue": "{}",
					  "variableName": "currentUser"
					},
					"children": [],
					"path": "useState.tpl",
					"prevent_delete": false,
					"cascades": false,
					"type": "element"
				  },
				  {
					"name": "Profile Menu Anchor",
					"value": "useState",
					"values": {
					  "defaultValue": "null",
					  "variableName": "profileMenuAnchor"
					},
					"children": [],
					"path": "useState.tpl",
					"prevent_delete": false,
					"cascades": false,
					"type": "element"
				  }
				],
				"prevent_delete": false,
				"cascades": true,
				"path": "componentHeader.tpl",
				"values": {}
			  },
			  {
				"name": "componentBody",
				"type": "element",
				"value": "componentBody",
				"children": [
				  {
					"name": "Menu",
					"value": "Menu",
					"values": {
					  "anchorElement": "profileMenuAnchor",
					  "onClose": "(params) => { setprofileMenuAnchor(null)}",
					  "className": "theme.profileMenu"
					},
					"children": [
					  {
						"name": "div",
						"value": "div",
						"values": {
						  "class": "theme.menuProfileDetails"
						},
						"type": "element",
						"path": "div.tpl",
						"children": [
						  {
							"name": "text",
							"value": "text",
							"values": {
							  "Content": "Hola {currentUser?.FirstName} {currentUser?.LastName}"
							},
							"type": "element",
							"path": "text.tpl",
							"children": [],
							"prevent_delete": false,
							"cascades": true,
						  }
						],
						"prevent_delete": false,
						"cascades": true,
					  },
					  {
						"path": "hide.tpl",
						"keyPath": "elements\\Material-UI\\hide.tpl",
						"type": "element",
						"helpText": "Hide elements based on screen size",
						"children": [
						  {
							"path": "MenuItem.tpl",
							"keyPath": "elements\\Material-UI\\Menu\\MenuItem.tpl",
							"type": "element",
							"helpText": "Adds a menu item into a menu",
							"name": "MenuItem",
							"prevent_delete": false,
							"cascades": true,
							"children": [
							  {
								"name": "div",
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.selectMenu"
								},
								"children": [
								  {
									"name": "Home",
									"value": "button",
									"values": {
									  "ButtonText": "Home",
									  "Color": "primary"
									},
									"type": "element",
									"path": "button.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": true,
								  },
								  {
									"name": "AboutUs",
									"value": "button",
									"values": {
									  "ButtonText": "AboutUs",
									  "Color": "primary"
									},
									"type": "element",
									"path": "button.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": true,
								  },
								  {
									"name": "Services",
									"value": "button",
									"values": {
									  "ButtonText": "Services",
									  "Color": "primary"
									},
									"type": "element",
									"path": "button.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": true,
								  },
								  {
									"name": "ContactUs",
									"value": "button",
									"values": {
									  "ButtonText": "ContactUs",
									  "Color": "primary"
									},
									"type": "element",
									"path": "button.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": true,
								  }
								],
								"path": "div.tpl",
								"prevent_delete": false,
								"cascades": true,
								"type": "element"
							  }
							],
							"value": "MenuItem",
							"values": {
							  "className": "theme.menuMobile"
							}
						  }
						],
						"name": "hide",
						"prevent_delete": false,
						"cascades": true,
						"value": "hide",
						"values": {
						  "hidevalue": "mdUp"
						}
					  },
					  {
						"path": "div.tpl",
						"keyPath": "elements\\Basic\\div.tpl",
						"type": "element",
						"children": [
						  {
							"name": "Profile",
							"value": "MenuItem",
							"values": {},
							"type": "element",
							"path": "MenuItem.tpl",
							"children": [
							  {
								"name": "text",
								"value": "text",
								"values": {
								  "Content": "Profile"
								},
								"type": "element",
								"path": "text.tpl",
								"children": [],
								"prevent_delete": false,
								"cascades": true,
							  }
							],
							"prevent_delete": false,
							"cascades": true,
						  },
						  {
							"name": "Logout",
							"value": "MenuItem",
							"values": {
							  "onclick": "// (params) => { AuthService.logout(); props.history.push('/') }"
							},
							"type": "element",
							"path": "MenuItem.tpl",
							"children": [
							  {
								"name": "text",
								"value": "text",
								"values": {
								  "Content": "Logout"
								},
								"type": "element",
								"path": "text.tpl",
								"children": [],
								"prevent_delete": false,
								"cascades": true,
							  }
							],
							"prevent_delete": false,
							"cascades": true,
						  }
						],
						"helpText": "Basic HTML Div element",
						"name": "div",
						"prevent_delete": false,
						"cascades": true,
						"value": "div",
						"values": {
						  "tag": "div",
						  "class": "theme.containerProfileLogoutMobile"
						}
					  },
					  {
						"path": "hide.tpl",
						"keyPath": "elements\\Material-UI\\hide.tpl",
						"type": "element",
						"helpText": "Hide elements based on screen size",
						"children": [
						  {
							"name": "div",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.iconSocials"
							},
							"children": [
							  {
								"name": "MaterialIcon",
								"value": "MaterialIcon",
								"values": {
								  "icon": "Instagram"
								},
								"type": "element",
								"path": "MaterialIcon.tpl",
								"children": [],
								"prevent_delete": false,
								"cascades": true,
							  },
							  {
								"name": "MaterialIcon",
								"value": "MaterialIcon",
								"values": {
								  "icon": "Facebook"
								},
								"type": "element",
								"path": "MaterialIcon.tpl",
								"children": [],
								"prevent_delete": false,
								"cascades": true,
							  }
							],
							"path": "div.tpl",
							"prevent_delete": false,
							"cascades": true,
							"type": "element"
						  }
						],
						"name": "hide",
						"prevent_delete": false,
						"cascades": true,
						"value": "hide",
						"values": {
						  "hidevalue": "mdUp"
						}
					  }
					],
					"path": "Menu.tpl",
					"prevent_delete": false,
					"cascades": true,
					"type": "element"
				  },
				  {
					"children": [
					  {
						"children": [
						  {
							"children": [
							  {
								"cascades": true,
								"name": "image",
								"path": "image.tpl",
								"prevent_delete": false,
								"type": "element",
								"value": "image",
								"values": {
								  "useAsset": "QsJCIsoD"
								},
								"children": []
							  }
							],
							"cascades": true,
							"name": "div",
							"path": "div.tpl",
							"prevent_delete": false,
							"type": "element",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.selectLogo"
							}
						  },
						  {
							"children": [
							  {
								"cascades": true,
								"name": "Home",
								"path": "button.tpl",
								"prevent_delete": false,
								"render": "(elem) => { return elem.values.ButtonText }",
								"renderTag": "button",
								"type": "element",
								"value": "button",
								"values": {
								  "ButtonText": "Home",
								  "Color": "primary"
								},
								"children": []
							  },
							  {
								"cascades": true,
								"name": "AboutUs",
								"path": "button.tpl",
								"prevent_delete": false,
								"render": "(elem) => { return elem.values.ButtonText }",
								"renderTag": "button",
								"type": "element",
								"value": "button",
								"values": {
								  "ButtonText": "AboutUs",
								  "Color": "primary"
								},
								"children": []
							  },
							  {
								"cascades": true,
								"name": "Services",
								"path": "button.tpl",
								"prevent_delete": false,
								"render": "(elem) => { return elem.values.ButtonText }",
								"renderTag": "button",
								"type": "element",
								"value": "button",
								"values": {
								  "ButtonText": "Services",
								  "Color": "primary"
								},
								"children": []
							  },
							  {
								"cascades": true,
								"name": "ContactUs",
								"path": "button.tpl",
								"prevent_delete": false,
								"render": "(elem) => { return elem.values.ButtonText }",
								"renderTag": "button",
								"type": "element",
								"value": "button",
								"values": {
								  "ButtonText": "ContactUs",
								  "Color": "primary"
								},
								"children": []
							  }
							],
							"cascades": true,
							"name": "div",
							"path": "div.tpl",
							"prevent_delete": false,
							"type": "element",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.selectMenu"
							}
						  },
						  {
							"children": [
							  {
								"path": "div.tpl",
								"keyPath": "elements\\Basic\\div.tpl",
								"type": "element",
								"children": [
								  {
									"cascades": true,
									"name": "MaterialIcon",
									"path": "MaterialIcon.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "MaterialIcon",
									"values": {
									  "icon": "Instagram"
									},
									"children": []
								  },
								  {
									"cascades": true,
									"name": "MaterialIcon",
									"path": "MaterialIcon.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "MaterialIcon",
									"values": {
									  "icon": "Facebook"
									},
									"children": []
								  }
								],
								"helpText": "Basic HTML Div element",
								"name": "div",
								"prevent_delete": false,
								"cascades": true,
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.iconSocials"
								}
							  },
							  {
								"path": "hide.tpl",
								"keyPath": "elements\\Material-UI\\hide.tpl",
								"type": "element",
								"helpText": "Hide elements based on screen size",
								"children": [
								  {
									"name": "IconButton",
									"value": "IconButton",
									"values": {
									  "className": "theme.profilePicture",
									  "Action": "(event) => { setprofileMenuAnchor(event.currentTarget) }",
									  "icon": "Menu"
									},
									"children": [],
									"path": "IconButton.tpl",
									"prevent_delete": false,
									"cascades": true,
									"type": "element"
								  }
								],
								"name": "hide",
								"prevent_delete": false,
								"cascades": true,
								"value": "hide",
								"values": {
								  "hidevalue": "mdUp"
								}
							  },
							  {
								"path": "hide.tpl",
								"keyPath": "elements\\Material-UI\\hide.tpl",
								"type": "element",
								"helpText": "Hide elements based on screen size",
								"children": [
								  {
									"path": "condition.tpl",
									"keyPath": "elements\\Programming\\condition.tpl",
									"type": "element",
									"helpText": "Make a decision based on a value",
									"children": [
									  {
										"cascades": true,
										"name": "IconButton",
										"path": "IconButton.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "IconButton",
										"values": {
										  "className": "theme.profilePicture",
										  "Action": "(event) => { setprofileMenuAnchor(event.currentTarget) }",
										  "icon": "Person"
										},
										"children": []
									  }
									],
									"name": "condition",
									"prevent_delete": false,
									"cascades": true,
									"value": "condition",
									"values": {
									  "condition": "!currentUser"
									}
								  },
								  {
									"path": "condition.tpl",
									"keyPath": "elements\\Programming\\condition.tpl",
									"type": "element",
									"helpText": "Make a decision based on a value",
									"children": [
									  {
										"name": "IconButton",
										"value": "IconButton",
										"values": {
										  "className": "theme.profilePicture",
										  "Action": "(event) => { setprofileMenuAnchor(event.currentTarget) }"
										},
										"children": [
										  {
											"name": "image",
											"value": "image",
											"values": {
											  "path": "/img/${currentUser.ProfilePic}",
											  "ClassName": []
											},
											"type": "element",
											"path": "image.tpl",
											"children": [],
											"prevent_delete": false,
											"cascades": true,
										  }
										],
										"path": "IconButton.tpl",
										"prevent_delete": false,
										"cascades": true,
										"type": "element"
									  }
									],
									"name": "condition",
									"prevent_delete": false,
									"cascades": true,
									"value": "condition",
									"values": {
									  "condition": "currentUser"
									}
								  }
								],
								"name": "hide",
								"prevent_delete": false,
								"cascades": true,
								"value": "hide",
								"values": {
								  "hidevalue": "mdDown"
								}
							  }
							],
							"cascades": true,
							"name": "div",
							"path": "div.tpl",
							"prevent_delete": false,
							"type": "element",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.selectSocialsProfile"
							}
						  }
						],
						"cascades": true,
						"name": "navbar",
						"path": "navbar.tpl",
						"prevent_delete": false,
						"type": "element",
						"value": "navbar",
						"values": {
						  "ClassName": "theme.soyelNavbar"
						}
					  }
					],
					"cascades": true,
					"name": "div",
					"path": "div.tpl",
					"prevent_delete": false,
					"type": "element",
					"value": "div",
					"values": {
					  "tag": "div",
					  "class": "theme.selectNavbar"
					}
				  }
				],
				"prevent_delete": false,
				"cascades": true,
				"path": "componentBody.tpl",
				"values": {}
			  }
			],
			"type": "element",
			"value": "component",
			"values": {
			  "name": "Topbar",
			  "props": "theme"
			}
		  }
		  ],
		  "cascades": true,
	"name": "Layout: Topbar",
	"path": "dummyEncloser.tpl",
	"prevent_delete": false,
	"type": "element",
	"value": "dummyEncloser",
	"values": {},
	"errored": false
}

if (!aptugo.findPageInTree) aptugo.findPageInTree = aptugo.pageUtils.findPageInTree

const containerPage = aptugo.findPageInTree(Application.pages, Parameters.parentPage)

const containerBody = containerPage.children.find(child => child.value === 'b')
if (containerBody) {
	if (!containerBody.children) containerBody.children = []
	containerBody.children.push(B)
}

return Application