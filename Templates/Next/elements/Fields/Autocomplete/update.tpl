/*
path: update.tpl
completePath: elements/Fields/Autocomplete/update.tpl
unique_id: zd6mrTlU
*/
if(typeof fields.{{ field.column_name | friendly | lower }} !== 'undefined') {{ singleName }}.{{ field.column_name | friendly | lower }} = new ObjectId(fields.{{ field.column_name | friendly | lower }}._id)
