/*
path: edit.tpl
type: file
unique_id: VFMHcgeod
icon: ico-field
sourceType: javascript
children: []
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set bpr %}
import TextField from '@mui/material/TextField'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% include includeTemplate('googlePlaces.tpl') with { element: { values: {
    'placesKey': field.apikey,
    'inputId': field.unique_id,
    'onchange': '(e) => { handle' ~ tableName ~ 'Change("' ~ (field.column_name | friendly) ~ '")([e.longitude, e.latitude]) }',
    'initialValue': 'var:' ~ tableName ~ 'data?.' ~ (field.column_name | friendly) ~ "?.coordinates || ''",
    'placeholder': field.placeholder|default('')
}}} %}
