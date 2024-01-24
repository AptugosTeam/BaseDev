/*
path: update.tpl
completePath: elements/Fields/Image/update.tpl
unique_id: hILFvubz
*/
{# if (options.req?.files && options.req.files.{{ field.column_name | friendly }} && options.req.files.{{ field.column_name | friendly }}.data) {
    if (!fs.existsSync(`${options.req.app.get('filesFolder')}`)) fs.mkdirSync(`${options.req.app.get('filesFolder')}`, { recursive: true })
    fs.writeFileSync(`${options.req.app.get('filesFolder')}/${options.req.files.{{ field.column_name | friendly }}.name}`, options.req.files.{{ field.column_name | friendly }}.data)
    updatedData['{{ field.column_name | friendly }}'] = options.req.files.{{ field.column_name | friendly }}.name
} #}