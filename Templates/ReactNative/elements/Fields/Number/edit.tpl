/*
path: edit.tpl
completePath: elements/Fields/Number/edit.tpl
unique_id: iTMTweVR
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import { TextInput } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextInput
    {% if element.values.DisableUnderline %}
        InputProps={ { disableUnderline: true } }
    {% endif %}
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
    margin='{{ element.values.margin|default("dense") }}'
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    className={ {% if element.values.classname %}{{ element.values.classname }}{% else %}'field_{{ field.column_name | friendly }}'{% endif %}}
    type="number"
    fullWidth
    variant="{{ element.values.variant|default('standard') }}"
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || '' }
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
/>
