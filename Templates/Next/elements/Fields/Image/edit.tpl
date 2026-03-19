/*
path: edit.tpl
completePath: elements/Fields/Image/edit.tpl
unique_id: 1NX62QJ2
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import FileUpload from '@components/FileUpload'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FileUpload
    {% if element.values.classname %}
        className={ {{ element.values.classname }} }
    {% endif %}
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    {% if field.placeholder %}
        placeholder={{ field.placeholder | textOrVariable }}
    {% endif %}
    value={ {{ tableName }}data.{{ field.column_name | friendly | lower }}}
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly | lower }}")}
    variant="{{ element.values.variant|default('standard') }}"
    {% if field.resizeWidth %}
        resizeWidth={ Number( {{field.resizeWidth|default(800)}} ) }
    {% endif %}
/>