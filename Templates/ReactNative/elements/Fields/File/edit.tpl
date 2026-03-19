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
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import FileUpload from '../components/FileUpload/FileUpload'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FileUpload
    accept="{{ field.filetype|default('*') }}"
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
    value={ {{ tableName }}data.{{ field.column_name | friendly }}}
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
/>