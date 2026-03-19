/*
path: show.tpl
completePath: elements/Fields/Number/show.tpl
unique_id: Tp07vbno
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>