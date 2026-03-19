/*
path: csvImport.tpl
type: file
unique_id: csvGBni9
icon: f:csvImport.svg
helpText: Uploads CSV data to an array of elements
options:
  - name: data
    display: Data to Upload
    type: text
    options: ''
  - name: header
    display: Header?
    type: checkbox
    options: ''
    settings: 
      default: false
  - name: onError
    display: Catch Error
    type: function
    options: ''
    advanced: true
    settings:
      default: console.error(error)
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
  {% if element.values.header %}header: true,{% endif %}
	complete: function(results) {
		{{ content|raw }}
	},
  error: function (error) {
    {% if element.values.onError %}
      {{ element.values.onError }} 
    {% else %}
    console.error(error)
    {% endif %}
  }
})