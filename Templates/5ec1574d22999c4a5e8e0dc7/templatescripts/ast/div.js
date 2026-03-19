(arguments) => {
  const path = arguments.path
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXElement() && path.node.openingElement.name.name === 'div') {
    console.log('************************************************************************************************ DIV')
    const unique_id = aptugocli.generateID()
    path.node.unique_id = unique_id

    const attributes = path.node.openingElement.attributes

    const dataTitleAttribute = aptugocli.ast.getRawAttribute('data-title', attributes)
    const classNameAttribute = aptugocli.ast.getRawAttribute('className', attributes)

    const ContenttoReturn = {
      "type": "element",
      "name": "div",
      "path": "div.tpl",
      "value": "div",
      "unique_id": unique_id,
      "parent": parent,
      "values": {
        "dataTitle": dataTitleAttribute,
        "className": classNameAttribute
      },
      "children": []
    }

    return {
      content: ContenttoReturn
    }
  }
  return null
}