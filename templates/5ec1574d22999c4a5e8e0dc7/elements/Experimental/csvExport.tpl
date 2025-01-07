/*
path: csvExport.tpl
type: file
unique_id: 6XnGBni9
icon: f:csvExport.svg
helpText: Downloads CSV data from an array of elements
options:
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: data
    display: Data to Download
    type: text
    options: ''
  - name: headers
    display: Headers in the CSV
    type: text
    options: ''
  - name: filename
    display: Filename
    type: text
    options: ''
  - name: separator
    display: Separator in the CSV
    type: dropdown
    options: 
      return [[';', 'Semicolon'],[',', 'Comma']]
  - name: onclick
    display: On Click
    type: function
    options: ''
    advanced: true
  - name: asyncOnClick
    display: Async On Click?
    type: checkbox
    advanced: true
    settings:
      default: false
settings:
  - name: Packages
    value: '"react-csv": "^2.0.3",'
children: []
*/
{% set bpr %}
import { CSVLink } from "react-csv"
{% endset %}
{{ save_delayed('bpr',bpr) }}
<CSVLink
  {% if element.values.className %}
  className={ {{element.values.className}} }
  {% endif %}
  data={ {{ element.values.data }} }
  {% if element.values.headers %}
  headers={ {{element.values.headers}} }
  {% endif %}
  {% if element.values.filename %}
  filename={ {{element.values.filename}} }
  {% endif %}
  {% if element.values.separator %}
  separator={"{{element.values.separator}}"}
  {% endif %}
  {% if element.values.onclick %}
    onClick={ {{element.values.onclick}} }
  {% endif %}
  {% if element.values.asyncOnClick %}
    asyncOnClick={true}
  {% endif %}
>{{ content|raw }}</CSVLink>