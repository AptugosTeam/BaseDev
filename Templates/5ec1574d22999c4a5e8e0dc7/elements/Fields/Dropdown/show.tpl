/*
path: show.tpl
completePath: elements/Fields/Dropdown/show.tpl
unique_id: P7NF6CDE
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field {% if element.values.classname %}className={ {{ element.values.classname }} } {% endif %}value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>