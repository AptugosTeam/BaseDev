/*
path: edit.tpl
type: file
unique_id: SNXsC89p
icon: ico-field
children: []
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set fieldValue = tableName ~ 'data.' ~ theField.column_name | friendly %}
  {% if element.values.alternativeValue %}
    {% set fieldValue = element.values.alternativeValue %}
  {% endif %}
  {% set saveValue = 'handle' ~ tableName ~ 'Change("' ~ theField.column_name | friendly ~ '")' %}
  {% if element.values.alternativeSaveMethod %}
    {% set saveValue = element.values.alternativeSaveMethod | functionOrCall %}
  {% endif %}
{% set bpr %}
import TravelExploreIcon from '@mui/icons-material/TravelExplore'
import { IconButton, InputAdornment, TextField } from '@mui/material'
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
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    type="text"
    fullWidth
    variant="{{ element.values.variant|default('standard') }}"
    InputProps={ {
        endAdornment: (
        <InputAdornment position="end">
            <IconButton
            aria-label="Visit URL"
            onClick={() => { window.open( {{ fieldValue }},'_blank').focus() }}
            edge="end"
            >
            <TravelExploreIcon />
            </IconButton>
        </InputAdornment>
        )
    }}
    value={ {{ fieldValue }}}
    onChange={ {{ saveValue }}}
/>