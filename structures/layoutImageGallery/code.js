const PH = [{
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
            "name": "Images Per Row",
            "cascades": false,
            "value": "useState",
            "values": {
                "variableName": "imagesPerRow",
                "defaultValue": "4"
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
            "value": "defineVariable",
            "values": {
                "variableName": "langStrings",
                "variableValue": "{\n    en: {\n      ImageGalleryTitle: \"Image Gallery\"\n    },\n    sp: {\n      ImageGalleryTitle: \"Galería de Imágenes\"\n    },\n  }"
            },
            "prevent_delete": false,
            "cascades": false
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
    "name": "Config: Image Gallery",
    "prevent_delete": false,
    "cascades": false,
    "type": "element",
    "value": "dummyEncloser"
},{
    "path": "dummyEncloser.tpl",
    "completePath": "elements/Basic/dummyEncloser.tpl",
    "children": [
        {
            "path": "loadFromRedux.tpl",
            "completePath": "elements/Programming/loadFromRedux.tpl",
            "display": "Load from Database",
            "type": "element",
            "icon": "ico-load-redux",
            "sourceType": "javascript",
            "calculatedName": "function (ele) { \n  try {\n    const tblname = aptugo.store.getState().application.tables.find(tbl => tbl.unique_id === ele.values.data).name\n    const calc = 'Load ' + tblname + ' from database'\n    return calc\n  } catch(e) {\n    return ele.name\n  }\n}",
            "options": [
                {
                    "name": "data",
                    "display": "Data",
                    "type": "dropdown",
                    "options": "return aptugo.store.getState().application.tables.map(({ unique_id, name }) => [unique_id, name])",
                    "settings": {
                        "aptugoOnLoad": "const element = arguments[0];\nif ( element.values.data ) {\n  const varsToAdd = {};\n  const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;\n  const tableInfo = aptugo.store.getState().application.tables.find(table => table.unique_id === element.values.data )\n  const tableFields = tableInfo.fields;\n  tableFields.forEach(tableField => { varsToAdd[tableField.column_name] = 'String' });\n  const finalVarsToAdd = {\n    [aptugo.friendly(tableInfo.name).toLowerCase() + 'Data']: {\n      loadingStatus: 'String',\n      addingStatus: 'String',\n      searchingStatus: 'String',\n      searchString: 'String',\n      totalDocs: 'String',\n      [aptugo.friendly(tableInfo.name).toLowerCase()]: { ...varsToAdd },\n      ['found' + aptugo.friendly(tableInfo.name).toLowerCase()]: { ...varsToAdd },\n      errField: 'String',\n      errStatus: 'String',\n      errMessage: 'String'\n    }\n  };\n  aptugo.variables.setPageVariable(page, element.unique_id, finalVarsToAdd);\n  if (element.values.variableName) {\n    aptugo.variables.setPageVariable(page, element.unique_id + '_2', { [element.values.variableName]: { ...varsToAdd } });\n  }\n}",
                        "active": true
                    }
                },
                {
                    "name": "variableName",
                    "display": "Variable Name",
                    "type": "text",
                    "options": ""
                },
                {
                    "name": "singleResult",
                    "display": "Obtain a single (or first) result",
                    "type": "checkbox"
                },
                {
                    "name": "onload",
                    "display": "Run code upon loading",
                    "type": "function",
                    "options": ""
                },
                {
                    "name": "searchString",
                    "display": "Search String",
                    "type": "text",
                    "options": ""
                },
                {
                    "name": "useExactMatch",
                    "display": "Should use an exact match?",
                    "type": "checkbox",
                    "options": ""
                },
                {
                    "name": "fieldToSearch",
                    "display": "Field To Search",
                    "type": "text",
                    "options": ""
                },
                {
                    "name": "sortColumn",
                    "display": "Sort Column",
                    "type": "text",
                    "options": ""
                },
                {
                    "name": "sortMethod",
                    "display": "Sort Method",
                    "type": "dropdown",
                    "options": "desc;asc"
                },
                {
                    "name": "elementsLimit",
                    "display": "Limit of Elements",
                    "type": "text",
                    "options": ""
                },
                {
                    "name": "donotpopulate",
                    "display": "Do NOT populate related tables",
                    "type": "checkbox",
                    "options": ""
                }
            ],
            "children": [],
            "open": false,
            "name": "Load Images",
            "originalName": "Load from Database",
            "cascades": false,
            "value": "loadFromRedux",
            "values": {
                "data": Parameters.table_unique_id,
                "variableName": "galleryImages"
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
    "name": "Definitions: Image Gallery",
    "prevent_delete": false,
    "cascades": false,
    "type": "element",
    "value": "dummyEncloser"
}]

const B = [{
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
                              "Content": "{lang?.ImageGalleryTitle}"
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
                      "tag": "h3"
                  }
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
                                          "name": "image",
                                          "value": "image",
                                          "values": {
                                              "path": "/img/${image.Picture}"
                                          },
                                          "type": "element",
                                          "prevent_delete": false,
                                          "cascades": false
                                      }
                                  ],
                                  "helpText": "Basic HTML Div element",
                                  "open": false,
                                  "name": "div",
                                  "value": "div",
                                  "values": {
                                      "style": "{ width: `${100 / imagesPerRow}%` }",
                                      "onclick": "e.currentTarget.classList.toggle('selected')"
                                  },
                                  "prevent_delete": false,
                                  "cascades": false
                              }
                          ],
                          "open": false,
                          "name": "loop",
                          "value": "loop",
                          "values": {
                              "variable": "galleryImages",
                              "variablename": "image"
                          },
                          "prevent_delete": false,
                          "cascades": false
                      }
                  ],
                  "helpText": "Basic HTML Div element",
                  "open": false,
                  "name": "div",
                  "value": "div",
                  "values": {
                      "class": "theme.imageList"
                  },
                  "prevent_delete": false,
                  "cascades": false
              }
          ],
          "open": false,
          "name": "Container",
          "value": "Container",
          "prevent_delete": false,
          "cascades": false,
          "values": {
              "maxWidth": "lg"
          }
      }
  ],
  "helpText": "Basic HTML Div element",
  "open": false,
  "name": "Image Gallery",
  "prevent_delete": false,
  "cascades": false,
  "value": "div",
  "values": {
      "class": "theme.imageGallery"
  }
}]

if (!aptugo.findPageInTree) aptugo.findPageInTree = aptugo.pageUtils.findPageInTree

const containerPage = aptugo.findPageInTree(Application.pages, Parameters.parentPage)

const containerHead = containerPage.children.find(child => child.value === 'ph')

if (containerHead) {
  if (!containerHead.children) containerHead.children = []
  containerHead.children.push(...PH)
}

const containerBody = containerPage.children.find(child => child.value === 'b')

if (containerBody) {
  if (!containerBody.children) containerBody.children = []
  containerBody.children.push(...B)
}

return Application