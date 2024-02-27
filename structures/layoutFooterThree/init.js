const structID = aptugo.generateID()

const B = {
	"structure": structID,
	"structureId": "layoutFooterThree",
	"structureName": "FooterThree",
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
						"children": [
						  {
							"children": [
							  {
								"children": [
								  {
									"children": [
									  {
										"cascades": false,
										"name": "image",
										"path": "image.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "image",
										"values": {
										  "useAsset": "FwOghc5q"
										},
										"children": []
									  }
									],
									"cascades": false,
									"name": "div Imagen",
									"path": "div.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "div",
									"values": {
									  "tag": "div",
									  "class": "theme.containerImage"
									}
								  },
								  {
									"children": [
									  {
										"children": [
										  {
											"cascades": false,
											"name": "Text Content",
											"path": "text.tpl",
											"prevent_delete": false,
											"type": "element",
											"value": "text",
											"values": {
											  "Content": "WOMAN"
											},
											"children": []
										  }
										],
										"cascades": false,
										"name": "typography",
										"path": "typography.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "typography",
										"values": {
										  "tag": "body1"
										}
									  },
									  {
										"children": [
										  {
											"cascades": false,
											"name": "Text Content",
											"path": "text.tpl",
											"prevent_delete": false,
											"type": "element",
											"value": "text",
											"values": {
											  "Content": "MAN"
											},
											"children": []
										  }
										],
										"cascades": false,
										"name": "typography",
										"path": "typography.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "typography",
										"values": {
										  "tag": "body1"
										}
									  },
									  {
										"children": [
										  {
											"cascades": false,
											"name": "Text Content",
											"path": "text.tpl",
											"prevent_delete": false,
											"type": "element",
											"value": "text",
											"values": {
											  "Content": "KIDS"
											},
											"children": []
										  }
										],
										"cascades": false,
										"name": "typography",
										"path": "typography.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "typography",
										"values": {
										  "tag": "body1"
										}
									  },
									  {
										"children": [
										  {
											"cascades": false,
											"name": "Text Content",
											"path": "text.tpl",
											"prevent_delete": false,
											"type": "element",
											"value": "text",
											"values": {
											  "Content": "ACCESSORIES"
											},
											"children": []
										  }
										],
										"cascades": false,
										"name": "typography",
										"path": "typography.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "typography",
										"values": {
										  "tag": "body1"
										}
									  },
									  {
										"children": [
										  {
											"cascades": false,
											"name": "Text Content",
											"path": "text.tpl",
											"prevent_delete": false,
											"type": "element",
											"value": "text",
											"values": {
											  "Content": "E-BOOKS"
											},
											"children": []
										  }
										],
										"cascades": false,
										"name": "typography",
										"path": "typography.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "typography",
										"values": {
										  "tag": "body1"
										}
									  }
									],
									"cascades": false,
									"name": "div Categories",
									"path": "div.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "div",
									"values": {
									  "tag": "div",
									  "class": "theme.containerCategories"
									}
								  },
								  {
									"children": [
									  {
										"cascades": false,
										"name": "MaterialIcon",
										"path": "MaterialIcon.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "MaterialIcon",
										"values": {
										  "icon": "Twitter"
										},
										"children": []
									  },
									  {
										"cascades": false,
										"name": "MaterialIcon",
										"path": "MaterialIcon.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "MaterialIcon",
										"values": {
										  "icon": "Facebook"
										},
										"children": []
									  },
									  {
										"cascades": false,
										"name": "MaterialIcon",
										"path": "MaterialIcon.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "MaterialIcon",
										"values": {
										  "icon": "Language"
										},
										"children": []
									  }
									],
									"cascades": false,
									"name": "div Socials",
									"path": "div.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "div",
									"values": {
									  "tag": "div",
									  "class": "theme.flexSocials"
									}
								  }
								],
								"cascades": false,
								"name": "div",
								"path": "div.tpl",
								"prevent_delete": false,
								"type": "element",
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.containersection"
								}
							  },
							  {
								"children": [
								  {
									"children": [
									  {
										"cascades": false,
										"name": "Text Content",
										"path": "text.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "text",
										"values": {
										  "Content": "SUBSCRIBE"
										},
										"children": []
									  }
									],
									"cascades": false,
									"name": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "typography",
									"values": {
									  "tag": "h5"
									}
								  },
								  {
									"children": [
									  {
										"children": [
										  {
											"cascades": false,
											"name": "text",
											"path": "text.tpl",
											"prevent_delete": false,
											"type": "element",
											"value": "text",
											"values": {
											  "Content": "Tu Email:"
											},
											"children": []
										  }
										],
										"cascades": false,
										"name": "hardcord field",
										"path": "div.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "div",
										"values": {
										  "tag": "div",
										  "class": "theme.hardcordField"
										}
									  },
									  {
										"children": [
										  {
											"cascades": false,
											"name": "MaterialIcon",
											"path": "MaterialIcon.tpl",
											"prevent_delete": false,
											"type": "element",
											"value": "MaterialIcon",
											"values": {
											  "icon": "KeyboardArrowRight"
											},
											"children": []
										  }
										],
										"cascades": false,
										"name": "button",
										"path": "button.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "button",
										"values": {
										  "ButtonText": "",
										  "Color": "primary",
										  "Action": "suscribe();"
										}
									  }
									],
									"cascades": false,
									"name": "div YourEmail",
									"path": "div.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "div",
									"values": {
									  "tag": "div",
									  "class": "theme.flexFieldYourEmail"
									}
								  }
								],
								"cascades": false,
								"name": "div Subscribe",
								"path": "div.tpl",
								"prevent_delete": false,
								"type": "element",
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.containerSubscribe"
								}
							  },
							  {
								"children": [
								  {
									"children": [
									  {
										"cascades": false,
										"name": "Text Content",
										"path": "text.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "text",
										"values": {
										  "Content": "Aptugo 2024. All rights reserved."
										},
										"children": []
									  }
									],
									"cascades": false,
									"name": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "typography",
									"values": {
									  "tag": "body1"
									}
								  },
								  {
									"children": [
									  {
										"cascades": false,
										"name": "Text Content",
										"path": "text.tpl",
										"prevent_delete": false,
										"type": "element",
										"value": "text",
										"values": {
										  "Content": "Design whatever you want. The limits are in the imagination"
										},
										"children": []
									  }
									],
									"cascades": false,
									"name": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"type": "element",
									"value": "typography",
									"values": {
									  "tag": "body1"
									}
								  }
								],
								"cascades": false,
								"name": "Copyright",
								"path": "div.tpl",
								"prevent_delete": false,
								"type": "element",
								"value": "div",
								"values": {
								  "tag": "div",
								  "class": "theme.copyright"
								}
							  }
							],
							"cascades": false,
							"name": "Container",
							"path": "Container.tpl",
							"prevent_delete": false,
							"type": "element",
							"value": "Container",
							"values": {
							  "className": "theme.containerFooterThree",
							  "maxWidth": "xl"
							}
						  }
						],
						"cascades": false,
						"name": "FooterThree",
						"path": "div.tpl",
						"prevent_delete": false,
						"type": "element",
						"value": "div",
						"values": {
						  "tag": "div",
						  "class": "theme.footerThree"
						}
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
			  "name": "FooterThree",
			  "props": "theme"
			}
		  }
		  ],
		  "cascades": true,
	"name": "Layout: FooterThree",
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