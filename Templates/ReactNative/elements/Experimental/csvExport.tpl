/*
path: csvExport.tpl
type: file
unique_id: 6XnGBni9
icon: ico-api-call
helpText: Downloads CSV data from an array of elements
options:
  - name: data
    display: Data to Download
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
>{{ content|raw }}</CSVLink>