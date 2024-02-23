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
children: []
*/

{% set bpr %}
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
/>