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
<Field {% if element.values.classname %} className={ {{ element.values.classname }} } {% endif %} value={(fieldData: any) => fieldData.{{ field.column_name | friendly }}}/>