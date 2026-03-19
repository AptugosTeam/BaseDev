/*
path: edit.tpl
type: file
unique_id: VFMHxQmb
icon: ico-field
sourceType: javascript
children: []
*/

{% set tableName = ( field | fieldData ).table.name | friendly %}
<input
    type="text" class="form-control"
    id="exampleFormControlInput1"
    {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
/>