/*
path: edit.tpl
type: file
unique_id: zdul9W1n
icon: ico-field
children: []
options:
  - name: fileType
    display: Accept Files
    type: text
    options: ''
settings:
  - name: Packages
    value: '"mui-file-input": "6.0.0",'
extraFiles:
  - source: 'elements/99_ExtraFiles/001_FileUploadComponent.tsx'
    destination: '/src/components/FileUpload/index.tsx'
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import FileUpload from '@components/FileUpload'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FileUpload
  {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
  label={{ field.prompt|default(field.column_name) | textOrVariable }}
  {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
  value={ {{ tableName }}data.{{ field.column_name | friendly }}}
  onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
  variant="{{ element.values.variant|default('standard') }}"
  accept="{{ field.filetype|default('*') }}"    
/>