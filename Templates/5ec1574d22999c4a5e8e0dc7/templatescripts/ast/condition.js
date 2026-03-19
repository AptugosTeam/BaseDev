(arguments) => {
  const path = arguments.path
  const parent = arguments.vars.parent || path.parentPath?.node.unique_id

  if (path.isJSXExpressionContainer()) {
    const expression = path.node.expression
    if (expression.type === 'LogicalExpression' && expression.operator === '&&') {
      console.log('************************************************************************************************ CONDITION')
      const unique_id = aptugocli.generateID()
      path.node.unique_id = unique_id

      const condition = aptugocli.ast.getRawFromBinaryExpression(expression.left)

      const ContenttoReturn = {
        "type": "element",
        "name": "condition",
        "path": "condition.tpl",
        "value": "condition",
        "unique_id": unique_id,
        "parent": parent,
        "values": {
          "condition": condition
        }
      };

      return {
        content: ContenttoReturn
      }
    }
  }
  return null
}
