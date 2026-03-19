/*
path: update.tpl
completePath: elements/Fields/File/update.tpl
unique_id: JBZcqdvZ
*/
if (options.req && options.req.files && options.req.files.{{ field.column_name | friendly }} && options.req.files.{{ field.column_name | friendly }}.data) {
    {% if field.s3 == '1' %}
        {% set theRegion = field.s3Region|default('us-east-2') %}
        const {Upload} = require("@aws-sdk/lib-storage")
        const {S3Client} = require('@aws-sdk/client-s3')
        let imageName = options.req.files.{{ field.column_name | friendly }}.name

        const uploadingFile = new Upload({
            client: new S3Client({ 
            region: '{{theRegion}}',
            credentials: {
                accessKeyId: '{{field.s3AccessKeyID}}',
                secretAccessKey: '{{field.s3AccessKeySecret}}',
            },
            }),
            params: {
            Bucket: '{{field.s3Bucket}}',
            Key: imageName,
            Body: options.req.files.{{ field.column_name | friendly }}.data,
            }
        })

        const done = await uploadingFile.done()
        updatedData['{{ field.column_name | friendly }}'] = done.Location
    {% else %}
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
    {% endif %}
}