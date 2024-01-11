/*
path: pdfView.tpl
type: file
unique_id: oKi40bpr
icon: ico-field
sourceType: javascript
options:
  - name: document
    display: Document Path
    type: text
  - name: className
    display: ClassName
    type: text
    options: ''
settings:
  - name: Packages
    value: '"expo-dev-client": "~2.4.12","react-native-pdf": "6.7.4","react-native-blob-util": "0.19.6",'
*/
{% set bprA %}
import { Dimensions, StyleSheet } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bprA) }}
{% set bpr %}
import Pdf from 'react-native-pdf'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bprB %}
const PDFstyles = StyleSheet.create({
  pdf: {
      flex:1,
      width:Dimensions.get('window').width,
      height:Dimensions.get('window').height,
  }
})
{% endset %}
{{ save_delayed('bpr', bprB) }}
<Pdf
  trustAllCerts={false}
  source={ { uri: {{ element.values.document | textOrVariableInCode }}, cache: true }}
  {% if element.values.onLoad %}
  onLoadComplete={(numberOfPages, filePath) => {
    {{ element.values.onLoadComplete }}
  }}
  {% endif %}
  {% if element.values.onPageChange %}
  onPageChanged={(page, numberOfPages) => {
    {{ element.values.onPageChange }}
  }}
  {% endif %}
  {% if element.values.onError %}
  onError={(error) => {
    {{ element.values.onError }}
  }}
  {% endif %}
  style={PDFstyles.pdf}
/>
