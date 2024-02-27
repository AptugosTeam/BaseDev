const structID = aptugo.generateID()

const B = {
	"structure": structID,
	"structureId": "layoutFooterOne",
	"structureName": "FooterOne",
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
				"destination": "src/components/{{ element.values.name | friendly }}/{{ element.values.name | friendly }}.tsx"
			  }
			],
			"name": "FooterOne",
			"prevent_delete": false,
			"cascades": false,
			"children": [
			  {
				"name": "componentHeader",
				"type": "element",
				"value": "componentHeader",
				"children": [],
				"prevent_delete": false,
				"cascades": false,
				"path": "componentHeader.tpl",
				"values": {}
			  },
			  {
				"name": "componentBody",
				"type": "element",
				"value": "componentBody",
				"children": [
				  {
					"name": "FooterOne",
					"value": "div",
					"values": {
					  "tag": "div",
					  "class": "theme.footerOne"
					},
					"children": [
					  {
						"name": "Container",
						"value": "Container",
						"values": {
						  "className": "theme.containerFooterOne",
						  "maxWidth": "xl"
						},
						"type": "element",
						"path": "Container.tpl",
						"children": [
						  {
							"name": "div Imagen",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.containerImage"
							},
							"type": "element",
							"path": "div.tpl",
							"children": [
							  {
								"name": "image",
								"value": "image",
								"values": {
								  "useAsset": "FwOghc5q"
								},
								"type": "element",
								"path": "image.tpl",
								"children": [],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "body1"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "Aptugo 2024. All rights reserved."
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "body1"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "Design whatever you want. The limits are in the imagination"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  }
							],
							"prevent_delete": false,
							"cascades": false
						  },
						  {
							"name": "div Categories",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.containerCategories"
							},
							"type": "element",
							"path": "div.tpl",
							"children": [
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "h5"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "CATEGORIES"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "body1"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "WOMAN"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "body1"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "MAN"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "body1"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "KIDS"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "body1"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "ACCESSORIES"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "body1"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "E-BOOKS"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  }
							],
							"prevent_delete": false,
							"cascades": false
						  },
						  {
							"name": "div Tag",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.containerTags"
							},
							"type": "element",
							"path": "div.tpl",
							"children": [
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "h5"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "TAG CLOUD"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "div Items Tags",
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.flexTags"
								},
								"type": "element",
								"path": "div.tpl",
								"children": [
								  {
									"name": "typography",
									"value": "typography",
									"values": {
									  "tag": "button"
									},
									"type": "element",
									"path": "typography.tpl",
									"children": [
									  {
										"name": "Text Content",
										"value": "text",
										"values": {
										  "Content": "LAROUS"
										},
										"type": "element",
										"path": "text.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  },
								  {
									"name": "typography",
									"value": "typography",
									"values": {
									  "tag": "button"
									},
									"type": "element",
									"path": "typography.tpl",
									"children": [
									  {
										"name": "Text Content",
										"value": "text",
										"values": {
										  "Content": "UI"
										},
										"type": "element",
										"path": "text.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  },
								  {
									"name": "typography",
									"value": "typography",
									"values": {
									  "tag": "button"
									},
									"type": "element",
									"path": "typography.tpl",
									"children": [
									  {
										"name": "Text Content",
										"value": "text",
										"values": {
										  "Content": "BLOG"
										},
										"type": "element",
										"path": "text.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  },
								  {
									"name": "typography",
									"value": "typography",
									"values": {
									  "tag": "button"
									},
									"type": "element",
									"path": "typography.tpl",
									"children": [
									  {
										"name": "Text Content",
										"value": "text",
										"values": {
										  "Content": "INSPIRATION"
										},
										"type": "element",
										"path": "text.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  },
								  {
									"name": "typography",
									"value": "typography",
									"values": {
									  "tag": "button"
									},
									"type": "element",
									"path": "typography.tpl",
									"children": [
									  {
										"name": "Text Content",
										"value": "text",
										"values": {
										  "Content": "UX"
										},
										"type": "element",
										"path": "text.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  },
								  {
									"name": "typography",
									"value": "typography",
									"values": {
									  "tag": "button"
									},
									"type": "element",
									"path": "typography.tpl",
									"children": [
									  {
										"name": "Text Content",
										"value": "text",
										"values": {
										  "Content": "BRAND"
										},
										"type": "element",
										"path": "text.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  }
							],
							"prevent_delete": false,
							"cascades": false
						  },
						  {
							"name": "div Subscribe",
							"value": "div",
							"values": {
							  "tag": "div",
							  "class": "theme.containerSubscribe"
							},
							"type": "element",
							"path": "div.tpl",
							"children": [
							  {
								"name": "typography",
								"value": "typography",
								"values": {
								  "tag": "h5"
								},
								"type": "element",
								"path": "typography.tpl",
								"children": [
								  {
									"name": "Text Content",
									"value": "text",
									"values": {
									  "Content": "SUBSCRIBE"
									},
									"type": "element",
									"path": "text.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "div YourEmail",
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.flexFieldYourEmail"
								},
								"type": "element",
								"path": "div.tpl",
								"children": [
								  {
									"name": "hardcord field",
									"value": "div",
									"values": {
									  "tag": "div",
									  "class": "theme.hardcordField"
									},
									"type": "element",
									"path": "div.tpl",
									"children": [
									  {
										"name": "text",
										"value": "text",
										"values": {
										  "Content": "Tu Email:"
										},
										"type": "element",
										"path": "text.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  },
								  {
									"name": "button",
									"value": "button",
									"values": {
									  "ButtonText": "",
									  "Color": "primary",
									  "Action": "suscribe();"
									},
									"type": "element",
									"path": "button.tpl",
									"children": [
									  {
										"name": "MaterialIcon",
										"value": "MaterialIcon",
										"values": {
										  "icon": "KeyboardArrowRight"
										},
										"type": "element",
										"path": "MaterialIcon.tpl",
										"children": [],
										"prevent_delete": false,
										"cascades": false
									  }
									],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  },
							  {
								"name": "div Socials",
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.flexSocials"
								},
								"type": "element",
								"path": "div.tpl",
								"children": [
								  {
									"name": "MaterialIcon",
									"value": "MaterialIcon",
									"values": {
									  "icon": "Twitter"
									},
									"type": "element",
									"path": "MaterialIcon.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
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
									"cascades": false
								  },
								  {
									"name": "MaterialIcon",
									"value": "MaterialIcon",
									"values": {
									  "icon": "Language"
									},
									"type": "element",
									"path": "MaterialIcon.tpl",
									"children": [],
									"prevent_delete": false,
									"cascades": false
								  }
								],
								"prevent_delete": false,
								"cascades": false
							  }
							],
							"prevent_delete": false,
							"cascades": false
						  }
						],
						"prevent_delete": false,
						"cascades": false
					  }
					],
					"path": "div.tpl",
					"prevent_delete": false,
					"cascades": false,
					"type": "element"
				  }
				],
				"prevent_delete": false,
				"cascades": false,
				"path": "componentBody.tpl",
				"values": {}
			  }
			],
			"type": "element",
			"value": "component",
			"values": {
			  "name": "FooterOne",
			  "props": "theme"
			}
		  }
		  ],
		  "cascades": true,
	"name": "Layout: Footer One",
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