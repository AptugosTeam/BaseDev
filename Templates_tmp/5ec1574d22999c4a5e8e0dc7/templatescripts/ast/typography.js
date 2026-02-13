(arguments) => {
  const path = arguments.path
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXElement() && path.node.openingElement.name.name === 'Typography') {
    console.log('************************************************************************************************ TYPOGRAPHY')
    const unique_id = aptugocli.generateID()
    path.node.unique_id = unique_id

    const attributes = path.node.openingElement.attributes

    const variantAttribute = aptugocli.ast.getRawAttribute('variant', attributes) || 'body1'

    const ContenttoReturn = {
      "type": "element",
      "name": "typography",
      "path": "typography.tpl",
      "value": "typography",
      "unique_id": unique_id,
      "parent": parent,
      "values": {
        "tag": variantAttribute
      },
      "children": [],
    }

    return {
      content: ContenttoReturn
    }
  }
  return null
}
