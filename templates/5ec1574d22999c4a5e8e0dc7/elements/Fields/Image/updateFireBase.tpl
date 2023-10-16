/*
path: updateFireBase.tpl
keyPath: elements/Fields/Image/updateFireBase.tpl
unique_id: L80e1tUQ
*/
{% set columnName = field.column_name | friendly %}
if (options.req?.files && options.req.files.{{ columnName }} && options.req.files.{{ columnName }}.data) {
  {% if field.gcloud == '1' %}
    const stream = require('stream')
    const {Storage} = require('@google-cloud/storage')
    const storage = new Storage({
      credentials: {
        "type": "{{ field.gcloud_type|default('service_account')}}",
        "project_id": "{{ field.gcloud_projectID|default(fieldWithData.table.projectId)}}",
        "private_key_id": "{{ field.gcloud_privateKeyID }}",
        "private_key": "{{ field.gcloud_privateKey }}",
        "client_email": "{{ field.gcloud_clientEmail }}",
        "client_id": "{{ field.gcloud_clientID }}",
        "auth_uri": "{{ field.gcloud_authUri }}",
        "token_uri": "{{ field.gcloud_tokenUri }}",
        "auth_provider_x509_cert_url": "{{ field.gcloud_authx509url }}",
        "client_x509_cert_url": "{{ field.gcloud_x509url }}",
        "universe_domain": "{{ field.gcloud_universeDomain }}"
      },
      projectId: "{{ field.gcloud_projectID|default(fieldWithData.table.projectId)}}",
    })

    const fileStream = new stream.PassThrough()
    const fileName = {% if field.gcloud_folder %}'{{ field.gcloud_folder }}/' + {% endif %}options.req.files.icon.name
    fileStream.end(options.req.files.icon.data)
    
    const bucket = storage.bucket('{{ field.gcloud_projectID|default(fieldWithData.table.projectId)}}.appspot.com');
    const file = bucket.file(fileName)

    fileStream.pipe(file.createWriteStream())
      .on('error', (err) => {
        console.error('Error uploading image:', err);
        res.status(500).json({ error: 'Image upload failed' });
      })
      .on('finish', async () => {
        const response = await storage.bucket('{{ field.gcloud_projectID|default(fieldWithData.table.projectId)}}.appspot.com').file(fileName).makePublic();
        resolve('Image uploaded successfully');
      })

    updatedData['{{ columnName }}'] = 'https://{{ field.gcloud_projectID|default(fieldWithData.table.projectId)}}.appspot.com.storage.googleapis.com/' + fileName
  {% else %}
    if (!fs.existsSync(`${options.req.app.get('filesFolder')}`)) fs.mkdirSync(`${options.req.app.get('filesFolder')}`, { recursive: true })
    fs.writeFileSync(`${options.req.app.get('filesFolder')}/${options.req.files.{{ field.column_name | friendly }}.name}`, options.req.files.{{ field.column_name | friendly }}.data)
    updatedData['{{ field.column_name | friendly }}'] = options.req.files.{{ field.column_name | friendly }}.name
  {% endif %}
}
