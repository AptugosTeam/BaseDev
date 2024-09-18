/*
path: csvAutomaticalImport.tpl
type: file
unique_id: csvGBn6M
icon: f:csvAutomaticImport.svg
helpText: Automatic import of a CSV
options:
  - name: data
    display: Data to Upload
    type: text
    options: ''
  - name: download
    display: Download CSV from URL
    type: checkbox
  - name: header
    display: Use First Row as Header
    type: checkbox
  - name: setCsvFunction
    display: Function to Load CSV Data (optional)
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
{{ save_delayed('bpr', bpr) }}

Papa.parse({{ element.values.data }}, {
    download: {{ element.values.download | default(false) }},
    header: {{ element.values.header | default(false) }},
    complete: function(results) {
      {% if element.values.setCsvFunction %}
        {{ element.values.setCsvFunction }}(results.data);
      {% endif %}
      {{ content|raw }}
    }
});
