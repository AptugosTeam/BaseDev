/*
path: csvExport.tpl
type: file
unique_id: 6XnGBni9
icon: ico-export-csv
helpText: Downloads CSV data from an array of elements
options:
  - name: data
    display: Data to Download
    type: text
    options: ''
  - name: filename
    display: File Name
    type: text
    options: ''
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
  data={ {{ element.values.data }} }
  {% if element.values.filename %} filename={ '{{element.values.filename}}' } {% endif %}
>{{ content|raw }}</CSVLink>