(arguments) => {
  const path = arguments.path
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXText()) {
    const textContent = path.node.value.trim()
    if (!textContent) return null
    const unique_id = aptugocli.generateID()
    path.node.unique_id = unique_id

    const ContenttoReturn = {
      "type": "element",
      "name": "text",
      "path": "text.tpl",
      "value": "text",
      "unique_id": unique_id,
      "parent": parent,
      "values": {
        "Content": textContent
      }
    }

    return {
      content: ContenttoReturn
    }
  }

  return null;
};