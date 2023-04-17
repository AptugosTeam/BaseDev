/*
path: show.tpl
completePath: elements/Fields/MultilineString/show.tpl
unique_id: 1UVCZinf
*/
{% set bpr %}
import Field from '../components/Table/Field'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if element.values.CutOnNewline %}
    <Field value={(fieldData: any) => fieldData.{{ field.column_name }}.substr(0, fieldData.{{ field.column_name }}.indexOf("\n") )}/>
{% else  %}
    <Field value={(fieldData: any) => fieldData.{{ field.column_name }}}/>
{% endif %}
