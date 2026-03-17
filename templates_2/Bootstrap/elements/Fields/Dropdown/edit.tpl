/*
path: edit.tpl
type: file
unique_id: uxhx3Vzb
icon: ico-field
sourceType: javascript
children: []
*/
{% if field.displaytype == 'btngroup' %}
{% include includeTemplate('FieldsDropdownbtngroup.tpl') with { 'field': field } %}
{% else %}
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import MenuItem from '@mui/material/MenuItem'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<TextField
    select
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    margin='{{ element.values.margin|default("dense") }}'
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    type="text"
    fullWidth
    variant="{{ element.values.variant|default('standard') }}"
    value={ {{ tableName }}data.{{ field.column_name | friendly }}}
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
>
{% if field.placeholder %}
<MenuItem value="" disabled>{{ field.placeholder }}</MenuItem>
{% endif %}
{% for item in field.options|split(';') %}
        <MenuItem key="{{ item }}" value="{{ item }}">{{ item }}</MenuItem>
{% endfor %}
</TextField>
{% endif %}