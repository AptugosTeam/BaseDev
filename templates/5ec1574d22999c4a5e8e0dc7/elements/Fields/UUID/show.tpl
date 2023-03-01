/*
path: show.tpl
keyPath: elements/Fields/UUID/show.tpl
unique_id: Qr9xUPZG
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>