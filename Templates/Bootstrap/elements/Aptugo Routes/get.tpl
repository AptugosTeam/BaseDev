/*
path: get.tpl
completePath: elements/Aptugo Routes/get.tpl
unique_id: AlPg3QRE
*/
{% if table.beforeRetrieve %}{{ table.beforeRetrieve }}{% endif %}
{{ table.name | friendly | lower }}.findAll({ req, res })
