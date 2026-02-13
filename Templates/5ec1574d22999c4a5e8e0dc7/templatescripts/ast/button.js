(arguments) => {
  const path = arguments.path
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXElement() && path.node.openingElement.name.name === 'Button') {
    console.log('************************************************************************************************ BUTTON')
    const unique_id = aptugocli.generateID()
    path.node.unique_id = unique_id

    const attributes = path.node.openingElement.attributes

    const colorAttribute = aptugocli.ast.getRawAttribute('color', attributes)
    const onClickAttribute = aptugocli.ast.getRawAttribute('onClickCapture', attributes)
    const classNameAttribute = aptugocli.ast.getRawAttribute('className', attributes)

    const ContenttoReturn = {
      "type": "element",
      "name": "button",
      "path": "button.tpl",
      "value": "button",
      "unique_id": unique_id,
      "parent": parent,
      "values": {
        "color": colorAttribute,
        "className": classNameAttribute,
        "onClick": onClickAttribute
      },
      "children": []
    }

    return {
      content: ContenttoReturn
    }
  }
  return null
}
