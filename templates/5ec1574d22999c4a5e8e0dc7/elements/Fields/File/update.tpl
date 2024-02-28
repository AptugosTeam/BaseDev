/*
path: update.tpl
completePath: elements/Fields/File/update.tpl
unique_id: JBZcqdvZ
*/
if (options.req && options.req.files && options.req.files.{{ field.column_name | friendly }} && options.req.files.{{ field.column_name | friendly }}.data) {
    if (!fs.existsSync(`${options.req.app.get('filesFolder')}`)) fs.mkdirSync(`${options.req.app.get('filesFolder')}`, { recursive: true })

    let fileName = options.req.files.{{ field.column_name | friendly }}.name

    let index = 0;
    const extensionIndex = fileName.lastIndexOf('.');
    const name = fileName.substring(0, extensionIndex);
    const extension = fileName.substring(extensionIndex);

    while (fs.existsSync(`${options.req.app.get('filesFolder')}/${fileName}`)) {
        index++;
        fileName = `${name}(${index})${extension}`;
    }

    fs.writeFileSync(`${options.req.app.get('filesFolder')}/${fileName}`, options.req.files.{{ field.column_name | friendly }}.data)
    updatedData['{{ field.column_name | friendly }}'] = fileName
}