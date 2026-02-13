/*
path: show.tpl
completePath: elements/Fields/Image/show.tpl
unique_id: Z1frMeIx
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Field value={(fieldData: any) => fieldData.{{ field.column_name | friendly }} ? <img src={`/img/${fieldData.{{ field.column_name | friendly }}}`} /> : <div />} />
