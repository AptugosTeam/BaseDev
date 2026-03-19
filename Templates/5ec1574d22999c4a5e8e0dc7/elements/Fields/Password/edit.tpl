/*
path: edit.tpl
completePath: elements/Fields/Password/edit.tpl
unique_id: zlxp4g5o
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
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    {% if not element.values.disableLabel %}
        label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    {% endif %}
    type="password"
    fullWidth
    {% if element.values.autocomplete %}
        autoComplete='{{ element.values.autocomplete }}'
    {% endif %}
    {% if element.values.fieldname %}name={{ element.values.fieldname | textOrVariable}} {% endif %}
    variant="{{ element.values.variant|default('standard') }}"
    value={ {{ tableName }}data.{{ field.column_name | friendly }}}
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
    {% if not element.values.allowError %}error={ {{ tableName | lower }}Data?.errField === '{{ field.column_name | friendly }}'}{% endif %}
    {% if not element.values.allowHelperText %}helperText={ {{ tableName | lower }}Data?.errField === '{{ field.column_name | friendly }}' && {{ tableName | lower }}Data.errMessage}{% endif %}
/>
