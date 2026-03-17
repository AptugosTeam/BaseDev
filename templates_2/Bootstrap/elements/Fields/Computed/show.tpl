/*
path: show.tpl
type: file
unique_id: comp04vE
icon: ico-field
sourceType: javascript
children: []
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>