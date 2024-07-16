(arguments) => {
  const path = arguments.path
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXElement() && path.node.openingElement.name.name === 'NavLink') {
    console.log('************************************************************************************************ NAVLINK')
    const unique_id = aptugocli.generateID()
    path.node.unique_id = unique_id

    const attributes = path.node.openingElement.attributes

    const toAttribute = aptugocli.ast.getRawAttribute('to', attributes)
    const classNameAttribute = aptugocli.ast.getRawAttribute('className', attributes)

    const ContenttoReturn = {
      "type": "element",
      "name": "navlink",
      "path": "navlink.tpl",
      "value": "navlink",
      "unique_id": unique_id,
      "parent": parent,
      "values": {
        "to": toAttribute,
        "className": classNameAttribute
      },
      "children": []
    }

    return {
      vars: { parent: unique_id },
      content: ContenttoReturn
    }
  }
  return null
}
