/*
path: ReactPDF.tpl
type: file
unique_id: asfl12
icon: ico-field
sourceType: javascript
options:
  - name: path
    display: File Path
    type: text
    options: ''
    required: true
  - name: maxPages
    display: Maximum number of pages to display
    type: text
    options: ''
  - name: pageWidth
    display: Page Width
    type: text
    options: ''
  - name: showActionPage
    display: Show Action Page
    type: checkbox
    settings:
      default: false
  - name: buttonText
    display: Text button
    type: text
    options: ''
    settings:
      propertyCondition: showActionPage
      condition: true
  - name: action
    display: Action button
    type: text
    options: ''
    settings:
      propertyCondition: showActionPage
      condition: true

settings:
  - name: Packages
    value: '"react-pdf": "7.7.1", "browserify-zlib": "^0.2.0","buffer": "^6.0.3","process": "^0.11.10","stream-browserify": "^3.0.0","util": "^0.12.4",'
children: []
*/

{% set bpr %}
  import { pdfjs } from 'react-pdf';
  pdfjs.GlobalWorkerOptions.workerSrc = new URL(
    'pdfjs-dist/build/pdf.worker.min.js',
    import.meta.url,
  ).toString();
  import ReactPDF from '@components/ReactPDF/ReactPDF'
{% endset %}
{{ save_delayed('bpr', bpr) }}

<ReactPDF 
    file={ {{element.values.path|textOrVariableInCode}} }
    {% if element.values.maxPages %}
        maxNumPages={ {{element.values.maxPages}} }
    {% endif %}
    {% if element.values.pageWidth %}
        pageWidth={ {{element.values.pageWidth}} }
    {% endif %}
    {% if element.values.showActionPage %}
        showActionPage={ {{element.values.showActionPage}} }
    {% endif %}
    {% if element.values.buttonText %}
        buttonText={ {{element.values.buttonText}} }
    {% endif %}
    {% if element.values.action %}
        action={ {{element.values.action}} }
    {% endif %}
/>