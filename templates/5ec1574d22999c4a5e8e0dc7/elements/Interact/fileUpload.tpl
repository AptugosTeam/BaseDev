/*
path: fileUpload.tpl
keyPath: elements/Interact/fileUpload.tpl
unique_id: Iak20dlO
options:
  - name: resize
    display: Resize Images Before Upload?
    type: checkbox
    settings:
      default: false
  - name: resizeWidth
    display: Resize Width
    type: text
    settings:
      propertyCondition: resize
      condition: true
      active: true
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import FileUpload from '../components/FileUpload/FileUpload'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FileUpload
    {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
    value={ {{ tableName }}data.{{ field.column_name | friendly }}}
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
    variant="{{ element.values.variant|default('standard') }}"
    {% if element.values.resize and element.values.resizeWidth %}
        resizeWidth={ Number( {{element.values.resizeWidth}} ) | default(800)}
    {% endif %}
/>
/>