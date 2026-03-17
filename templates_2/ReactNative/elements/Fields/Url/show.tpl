/*
path: show.tpl
type: file
unique_id: mneui7TD
icon: ico-field
children: []
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => `<a href="{{field.prepend}}${fieldData.{{ field.column_name | friendly }}}">${fieldData.{{ field.column_name | friendly }}}</a>`}/>