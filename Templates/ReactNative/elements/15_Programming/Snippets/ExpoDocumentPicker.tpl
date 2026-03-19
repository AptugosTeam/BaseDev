/*
path: ExpoDocumentPicker.tpl
keyPath: elements/15_Programming/Snippets/ExpoDocumentPicker.tpl
unique_id: wXbLkbix
options:
  - name: functionName
    display: Function Name
    type: text
    settings:
      default: 'pickDocument'
  - name: varname
    display: Variable Name
    type: text
    options: ''
    settings:
      default: 'document'
  - name: uploadURL
    display: Upload URL
    type: text
    options: ''
  - name: type
    display: Document Type
    type: text
    options: ''
    settings:
      default: '*/*'
  - name: Async
    display: Async Load
    type: checkbox
settings:
  - name: Packages
    value: '"expo-document-picker": "~14.0.7",'
*/
{% set bpr %}
import axios from 'axios'
import * as DocumentPicker from 'expo-document-picker'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const {{ element.values.functionName | default('pickDocument')}} = async () => {
  const result = await DocumentPicker.getDocumentAsync({
    type: '{{ element.values.type | default("*/*") }}',
    copyToCacheDirectory: true,
  })

  if (result.canceled) return


  for (var asset of result.assets) {
    const uriParts = asset.name.split('.')
    const fileExtension = uriParts.pop()

    if (onSendMessage) onSendMessage({
      type: 'document',
      document: {
        uri: asset.uri,
        name: `${uriParts.join('.')}-${Date.now()}.${fileExtension}`,
        type: asset.mimeType,
      }
    })
  }
}
{% endset %}
{{ save_delayed('ph',ph)}}