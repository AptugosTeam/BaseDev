/*
path: pdfRenderer.tpl
completePath: elements/Experimental/PDF/pdfRenderer.tpl
type: file
unique_id: ovipdf7bpr
icon: f:pdfRenderer.svg
sourceType: javascript
settings:
  - name: Packages
    value: '"@react-pdf/renderer": "^2.0.20","assert": "^2.0.0","browserify-zlib": "^0.2.0","buffer": "^6.0.3","process": "^0.11.10","stream-browserify": "^3.0.0","util": "^0.12.4",'
options:
  - name: style
    display: Viewer Styles
    type: text
childs:
  - name: pdfDocument
    element: pdfDocument
*/
{% set bpr %}
 import { PDFViewer } from '@react-pdf/renderer'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<PDFViewer
  {% if element.values.style %}
    style={ {{ element.values.style | raw }} }
  {% endif %}
>
  {{ content | raw }}
</PDFViewer>
