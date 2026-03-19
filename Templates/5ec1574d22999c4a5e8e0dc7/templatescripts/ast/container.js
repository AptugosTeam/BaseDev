(arguments) => {
  const path = arguments.path
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXElement() && path.node.openingElement.name.name === 'Container') {
    console.log('************************************************************************************************ CONTAINER')
    const unique_id = aptugocli.generateID()
    path.node.unique_id = unique_id

    const attributes = path.node.openingElement.attributes

    const maxwidthAttribute = aptugocli.ast.getRawAttribute('maxWidth', attributes)
    const classNameAttribute = aptugocli.ast.getRawAttribute('className', attributes)

    const ContenttoReturn = {
      "type": "element",
      "name": "container",
      "path": "container.tpl",
      "value": "container",
      "unique_id": unique_id,
      "parent": parent,
      "values": {
        "maxWidth": maxwidthAttribute,
        "className": classNameAttribute
      },
      "children": [],
    }

    return {
      content: ContenttoReturn
    }
  }
  return null
}
