/*
path: edit.tpl
type: file
unique_id: q9uSxre7
icon: ico-field
sourceType: javascript
children: []
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextField
    {% if element.values.DisableUnderline %}
        InputProps={ { disableUnderline: true } }
    {% endif %}
    {% if element.values.maxLength %}
        inputProps={ { maxLength: {{ element.values.maxLength }}, } }
    {% endif %}
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
    type="text"
    fullWidth
    multiline
    className={ {% if element.values.classname %}{{ element.values.classname }}{% else %}'field_{{ field.column_name | friendly }}'{% endif %}}
    variant="{{ element.values.variant|default('standard') }}"
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || '' }
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
/>