
const PH = {
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
          "name": "Image: Background Image Path",
          "prevent_delete": false,
          "cascades": false,
          "value": "defineVariable",
          "values": {
              "variableName": "backgroundImagePath",
              "variableValue": "\"/img/cafe.jpg\""
          }
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
          "name": "Hero Text",
          "prevent_delete": false,
          "cascades": false,
          "value": "defineVariable",
          "values": {
              "variableName": "h1Content",
              "variableValue": "\"El perfurme del Café\""
          }
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
          "name": "Hero Extra Text",
          "prevent_delete": false,
          "cascades": false,
          "value": "defineVariable",
          "values": {
              "variableName": "h2Content",
              "variableValue": "\"Somos expertos en café, y por eso nos apasionan todos sus tipos y calidades\""
          }
      }
  ],
  "icon": "ico-dummy-enclosure",
  "helpText": "Organizational unit with no render value",
  "open": false,
  "name": "Config: Hero Image",
  "prevent_delete": false,
  "cascades": false,
  "type": "element",
  "value": "dummyEncloser"
}

const B = {
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
                  "path": "grid.tpl",
                  "completePath": "elements/Material-UI/grid.tpl",
                  "children": [
                      {
                          "path": "grid.tpl",
                          "completePath": "elements/Material-UI/grid.tpl",
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
                                                  "value": "text",
                                                  "prevent_delete": false,
                                                  "cascades": false,
                                                  "values": {
                                                      "Content": "{h1Content}"
                                                  }
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
                                          "prevent_delete": false,
                                          "cascades": false,
                                          "type": "element",
                                          "value": "typography",
                                          "values": {
                                              "tag": "h1"
                                          }
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
                                                  "value": "text",
                                                  "prevent_delete": false,
                                                  "cascades": false,
                                                  "values": {
                                                      "Content": "{h2Content}"
                                                  }
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
                                          "prevent_delete": false,
                                          "cascades": false,
                                          "type": "element",
                                          "value": "typography",
                                          "values": {
                                              "tag": "h2"
                                          }
                                      }
                                  ],
                                  "helpText": "Basic HTML Div element",
                                  "open": false,
                                  "name": "div",
                                  "prevent_delete": false,
                                  "cascades": false,
                                  "value": "div",
                                  "values": {
                                      "class": "theme.heroDarkArea"
                                  }
                              }
                          ],
                          "options": [
                              {
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
                          "name": "grid",
                          "prevent_delete": false,
                          "cascades": false,
                          "type": "element",
                          "value": "grid",
                          "values": {
                              "midcolumns": "5",
                              "smallcolumns": "12"
                          }
                      }
                  ],
                  "options": [
                      {
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
                  "name": "grid",
                  "prevent_delete": false,
                  "cascades": false,
                  "type": "element",
                  "value": "grid",
                  "values": {
                      "container": true
                  }
              }
          ],
          "open": false,
          "name": "Container",
          "prevent_delete": false,
          "cascades": false,
          "value": "Container",
          "values": {
              "maxWidth": "lg"
          }
      }
  ],
  "helpText": "Basic HTML Div element",
  "open": false,
  "name": "Layout: Hero Image",
  "prevent_delete": false,
  "cascades": false,
  "value": "div",
  "values": {
      "id": "herosection",
      "style": "{ backgroundImage: `url(${backgroundImagePath})` }",
      "class": "theme.heroImage"
  }
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