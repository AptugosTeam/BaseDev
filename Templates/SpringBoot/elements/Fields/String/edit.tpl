/*
path: edit.tpl
type: file
unique_id: VFMHxQmb
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
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    {% if not element.values.disableLabel %}
        label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    {% endif %}
    type="text"
    fullWidth
    className={ {% if element.values.classname %}{{ element.values.classname }}{% else %}'field_{{ field.column_name | friendly }}'{% endif %}}
    variant="{{ element.values.variant|default('standard') }}"
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || '' }
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
    {% if element.values.onBlur %}onBlur={ {{ element.values.onBlur | functionOrCall }} }{% endif %}
    error={ {{ tableName | lower }}Data?.errField === '{{ field.column_name | friendly }}'}
    helperText={ {{ tableName | lower }}Data?.errField === '{{ field.column_name | friendly }}' && {{ tableName | lower }}Data.errMessage}
/>
