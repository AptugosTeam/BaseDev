/*
path: downloadPdf.tpl
type: file
unique_id: oKi37bpr
icon: ico-field
sourceType: javascript
options:
  - name: fileName
    display: Filename
    type: text
settings:
  - name: Packages
    value: '"@react-pdf/renderer": "^2.0.20","assert": "^2.0.0","browserify-zlib": "^0.2.0","buffer": "^6.0.3","process": "^0.11.10","stream-browserify": "^3.0.0","util": "^0.12.4",'
childs:
  - name: Document
    element: pdfDocument
*/
{% set bpr %}
import { PDFDownloadLink } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
const MyDocument = () => (
  {{ content | raw }}
)
{% endset %}
{{ save_delayed('ph', ph) }}
<PDFDownloadLink document={<MyDocument />} fileName={{ element.values.fileName | textOrVariable | default('"download.pdf"')}}>
  {({ blob, url, loading, error }) => loading ? 'Loading document...' : 'Download now!'}
</PDFDownloadLink>