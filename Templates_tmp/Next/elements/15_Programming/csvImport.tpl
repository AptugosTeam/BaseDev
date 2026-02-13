/*
path: csvImport.tpl
type: file
unique_id: csvGBni9
icon: ico-csv
helpText: Uploads CSV data to an array of elements
options:
  - name: data
    display: Data to Upload
    type: text
    options: ''
settings:
  - name: Packages
    value: '"papaparse": "^5.3.2",'
children: []
*/
{% set bpr %}
import Papa from "papaparse"
{% endset %}
{{ save_delayed('bpr',bpr) }}
Papa.parse({{ element.values.data }}, {
	complete: function(results) {
		{{ content|raw }}
	}
})