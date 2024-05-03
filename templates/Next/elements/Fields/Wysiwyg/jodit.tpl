/*
path: jodit.tpl
type: file
unique_id: Sb6hcLxZ
icon: ico-field
children: []
settings:
  - name: Packages
    value: >-
      "jodit-react": "latest",
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import HTMLEditor from "../components/Jodit"
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FormControl margin="dense" fullWidth>
  <HTMLEditor
    initialValue={ {{ tableName | friendly }}data.{{ field.column_name | friendly }} || '' }
    updateState={ (newdata) => handle{{ tableName | friendly }}Change('{{ field.column_name | friendly }}')(newdata) }
    config={ {
      toolbar: false,
      inline: true,
      toolbarInlineForSelection: true,
      popup: {
        selection: ["bold","underline","italic","ul","ol","outdent","indent","fontsize","brush","cut","paragraph","link","align","dots"]
      },
      spellcheck: false,
      enableDragAndDropFileToEditor: true,
      uploader: {
        insertImageAsBase64URI: true
      }
	  } }
  />
</FormControl>