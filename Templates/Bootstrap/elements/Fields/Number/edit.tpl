/*
path: edit.tpl
completePath: elements/Fields/Number/edit.tpl
unique_id: iTMTweVR
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set searchFieldParams = { element: { values: { type: 'number' } } } %}
{% include includeTemplate('uncontrolledInput.tpl') with searchFieldParams %}
