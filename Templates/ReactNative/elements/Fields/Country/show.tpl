/*
path: show.tpl
type: file
unique_id: SvMmCAdg
icon: ico-field
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>