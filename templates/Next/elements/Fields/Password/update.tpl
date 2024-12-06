/*
path: update.tpl
completePath: elements/Fields/Password/update.tpl
unique_id: ATZb20Br
*/
{% set tableSingleName = table.singleName | friendly | lower %}
{{ add_setting(tableSingleName ~ '_File_Start', 'import bcrypt from "bcryptjs"') }}
if( typeof req.body.{{ field.column_name | friendly }} !== 'undefined') var {{ field.column_name | friendly }} = bcrypt.hashSync(req.body.{{ field.column_name | friendly }} + '', 10)