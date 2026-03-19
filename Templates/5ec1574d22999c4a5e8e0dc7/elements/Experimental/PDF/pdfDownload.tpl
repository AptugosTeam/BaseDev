/*
path: pdfDownload.tpl
completePath: elements/Experimental/PDF/pdfDownload.tpl
type: file
unique_id: oKi37bpr
icon: f:pdfDownload.svg
sourceType: javascript
options:
  - name: fileName
    display: Filename
    type: text
  - name: downtext
    display: Download Button Text
    type: text
    settings:
      active: true
      default: 'Download Now!'
  - name: style
    display: Download Button Styles
    type: text
settings:
  - name: Packages
    value: '"@react-pdf/renderer": "latest","assert": "^2.0.0","browserify-zlib": "^0.2.0","buffer": "^6.0.3","process": "^0.11.10","stream-browserify": "^3.0.0","util": "^0.12.4",'
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
<PDFDownloadLink 
  document={<MyDocument />} 
  fileName={{ element.values.fileName | textOrVariable | default('"download.pdf"')}} 
  {% if element.values.style %}
    style={ {{ element.values.style | raw }} }
  {% endif %}
>
  {({ blob, url, loading, error }) => loading ? 'Loading document...' : '{{ element.values.downtext | default("Download Now!") }}'}
</PDFDownloadLink>