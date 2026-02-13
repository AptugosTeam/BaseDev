/*
path: addExtraFiles.tpl
keyPath: elements/Programming/addExtraFiles.tpl
unique_id: NQcH20AG
options:
  - name: mainFolder
    display: Main Folder
    type: dropdown
    options: >-
      return [['front-end','Front end'],['back-end','Back end']]
  - name: folderPath
    display: Folder Path
    type: text
  - name: filename
    display: Filename (with extension)
    type: text
  - name: code
    display: Code
    type: code
  - name: customroute
    display: Custom Route (without filename )
    type: text
    advanced: true  
*/

{% set theconstructor %}
  {{ element.values.code }}
  {{ content | raw }}
{% endset %}

{% if element.values.customroute %}
  {{ addExtraFile(element.values.customroute ~ '/' ~ element.values.filename , theconstructor) }}
{% else %}
  {{ addExtraFile( element.values.mainFolder | default("back-end") ~ '/' ~ element.values.folderPath ~ '/' ~ element.values.filename, theconstructor) }}
{% endif %}
