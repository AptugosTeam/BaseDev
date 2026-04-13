/*
path: addExtraFiles.tpl
keyPath: elements/Programming/addExtraFiles.tpl
unique_id: NQcH20AG
helpText: Generate an extra source file in the frontend or backend output and fill it with custom code
options:
  - name: mainFolder
    display: Main Folder
    helpText: Choose whether the generated file should be created inside the frontend or backend output
    type: dropdown
    options: >-
      return [['front-end','Front end'],['back-end','Back end']]
  - name: folderPath
    display: Folder Path
    helpText: Relative folder path where the generated file should be written
    type: text
  - name: filename
    display: Filename (with extension)
    helpText: Final file name including its extension, such as index.tsx or helper.js
    type: text
  - name: code
    display: Code
    helpText: Raw file contents inserted into the generated extra file before rendering child content
    type: code
  - name: customroute
    display: Custom Route (without filename )
    helpText: Optional full custom output path used instead of combining Main Folder and Folder Path
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
