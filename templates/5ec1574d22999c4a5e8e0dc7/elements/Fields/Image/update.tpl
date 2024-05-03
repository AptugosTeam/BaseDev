/*
path: update.tpl
completePath: elements/Fields/Image/update.tpl
unique_id: hILFvubz
*/
if (options.req?.files && options.req.files.{{ field.column_name | friendly }} && options.req.files.{{ field.column_name | friendly }}.data) {
    if (!fs.existsSync(`${options.req.app.get('filesFolder')}`)) fs.mkdirSync(`${options.req.app.get('filesFolder')}`, { recursive: true })

    let imageName = options.req.files.{{ field.column_name | friendly }}.name

    let index = 0;
    const extensionIndex = imageName.lastIndexOf('.');
    const name = imageName.substring(0, extensionIndex);
    const extension = imageName.substring(extensionIndex);

    while (fs.existsSync(`${options.req.app.get('filesFolder')}/${imageName}`)) {
        index++;
        imageName = `${name}(${index})${extension}`;
    }

    fs.writeFileSync(`${options.req.app.get('filesFolder')}/${imageName}`, options.req.files.{{ field.column_name | friendly }}.data)
    updatedData['{{ field.column_name | friendly }}'] = imageName
}