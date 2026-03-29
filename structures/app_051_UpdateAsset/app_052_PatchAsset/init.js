const assetID = Parameters.asset
const operation = Parameters.operation
const target = Parameters.target || ''
const content = Parameters.content || ''

if (!assetID) {
  throw new Error('Missing required parameter: asset')
}

if (!operation) {
  throw new Error('Missing required parameter: operation')
}

const validOperations = [
  'replace_text',
  'insert_before',
  'insert_after',
  'append',
  'prepend',
]

if (!validOperations.includes(operation)) {
  throw new Error(`Invalid operation: ${operation}`)
}

const assetObject = Application.assets.find((asset) => asset.id === assetID)

if (!assetObject) {
  throw new Error(`Asset not found: ${assetID}`)
}

const fileName = `${assetObject.id}_${assetObject.name}`
const filePath = aptugo.join(aptugo.apps._getAppDropsFolder(Parameters.app), fileName)

let originalContent = ''

if (aptugo.fileExists(filePath)) {
  const fileData = aptugo.readFile(filePath)

  if (Buffer.isBuffer(fileData)) {
    originalContent = fileData.toString('utf-8')
  } else if (typeof fileData === 'string') {
    originalContent = fileData
  } else {
    originalContent = String(fileData)
  }
} else {
  throw new Error(`Asset file does not exist on disk: ${filePath}`)
}

let newContent = originalContent

switch (operation) {
  case 'replace_text': {
    if (!target) {
      throw new Error('Parameter "target" is required for replace_text')
    }

    if (!originalContent.includes(target)) {
      throw new Error('Target text not found in asset')
    }

    newContent = originalContent.replace(target, content)
    break
  }

  case 'insert_before': {
    if (!target) {
      throw new Error('Parameter "target" is required for insert_before')
    }

    if (!originalContent.includes(target)) {
      throw new Error('Target text not found in asset')
    }

    newContent = originalContent.replace(target, content + target)
    break
  }

  case 'insert_after': {
    if (!target) {
      throw new Error('Parameter "target" is required for insert_after')
    }

    if (!originalContent.includes(target)) {
      throw new Error('Target text not found in asset')
    }

    newContent = originalContent.replace(target, target + content)
    break
  }

  case 'append': {
    newContent = originalContent + content
    break
  }

  case 'prepend': {
    newContent = content + originalContent
    break
  }

  default:
    throw new Error(`Unsupported operation: ${operation}`)
}

const buffer = Buffer.from(newContent, 'utf-8')

aptugo.writeFile(filePath, buffer, { pretify: false })

return Application