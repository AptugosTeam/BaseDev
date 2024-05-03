const structID = aptugo.generateID()

const B = {
	"structure": structID,
	"structureId": "layoutFooterTwo",
	"structureName": "FooterTwo",
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
									"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
									"cascades": false,
									"name": "typography",
									"originalName": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"renderTag": "(elem) => { return elem.values.tag }",
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
									"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
									"cascades": false,
									"name": "typography",
									"originalName": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"renderTag": "(elem) => { return elem.values.tag }",
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
									"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
									"cascades": false,
									"name": "typography",
									"originalName": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"renderTag": "(elem) => { return elem.values.tag }",
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
									"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
									"cascades": false,
									"name": "typography",
									"originalName": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"renderTag": "(elem) => { return elem.values.tag }",
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
									"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
									"cascades": false,
									"name": "typography",
									"originalName": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"renderTag": "(elem) => { return elem.values.tag }",
									"type": "element",
									"value": "typography",
									"values": {
									  "tag": "body1"
									}
								  }
								],
								"cascades": false,
								"name": "div Menu",
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
									"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
									"cascades": false,
									"name": "typography",
									"originalName": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"renderTag": "(elem) => { return elem.values.tag }",
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
									"calculatedName": "function (ele) { \n  try {\n    return ele.values.tag\n  } catch(e) {\n    return 'Typography'\n  }\n}",
									"cascades": false,
									"name": "typography",
									"originalName": "typography",
									"path": "typography.tpl",
									"prevent_delete": false,
									"renderTag": "(elem) => { return elem.values.tag }",
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
							  "className": "theme.containerFooterTwo",
							  "maxWidth": "xl"
							}
						  }
						],
						"cascades": false,
						"name": "Footertwo",
						"path": "div.tpl",
						"prevent_delete": false,
						"type": "element",
						"value": "div",
						"values": {
						  "tag": "div",
						  "class": "theme.footerTwo"
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
			  "name": "FooterTwo",
			  "props": "theme"
			}
		  }
		  ],
		  "cascades": true,
	"name": "Layout: Footer Two",
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