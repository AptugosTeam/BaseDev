/*
path: show.tpl
completePath: elements/Fields/Datetime/show.tpl
unique_id: x6nXr6Eu
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>