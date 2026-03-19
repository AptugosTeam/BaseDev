(arguments) => {
  const path = arguments.path;
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXElement() && path.node.openingElement.name.name === 'picture') {
    console.log('************************************************************************************************ IMAGE')
    const unique_id = aptugocli.generateID()
    path.node.unique_id = unique_id

    const children = path.node.children;
    const imgElement = children.find(child => child.type === 'JSXElement' && child.openingElement.name.name === 'img');

    if (imgElement) {
      const imgAttributes = imgElement.openingElement.attributes;

      const srcAttribute = aptugocli.ast.getRawAttribute('src', imgAttributes)
      const altAttribute = aptugocli.ast.getRawAttribute('alt', imgAttributes)
      
      const ContenttoReturn = {
        "type": "element",
        "name": "image",
        "path": "image.tpl",
        "value": "image",
        "unique_id": unique_id,
        "parent": parent,
        "values": {
          "src": srcAttribute,
          "alt": altAttribute
        },
        "children": []
      };

      return {
        content: ContenttoReturn
      }
    }
  }
  return null;
};