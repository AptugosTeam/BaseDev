/*
path: show.tpl
completePath: elements/Fields/File/show.tpl
unique_id: R6hOrDAB
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field {% if element.values.classname %}
    className={ {{ element.values.classname }} }
{% endif %}
{% if field.s3 == '1' %}
    value={(fieldData: any) => '<a href="'fieldData.{{ field.column_name | friendly }}'" download>' + fieldData.{{ field.column_name | friendly }} + '</a>'}/>
{% else %}
    value={(fieldData: any) => '<a href="/img/' + fieldData.{{ field.column_name | friendly }} + '" download>' + fieldData.{{ field.column_name | friendly }} + '</a>'}/>
{% endif %}