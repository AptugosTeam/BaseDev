/*
path: update.tpl
completePath: elements/Fields/File/update.tpl
unique_id: JBZcqdvZ
*/
{% set fieldName = field.column_name | friendly %}
{% set tableSingleName = table.singleName | friendly | lower %}
{% if field.storage == 's3' %}
  {{ add_setting(tableSingleName ~ '_File_Start', 'import { S3Client, PutObjectCommand } from "@aws-sdk/client-s3"')}}
  {{ add_setting('Packages', '"@aws-sdk/client-s3": "^3.670.0",') }}
  {% set clientDefinition %}
    const client = new S3Client({
      region: '{{ field.s3Region }}',
      credentials: {
        accessKeyId: '{{ field.s3AccessKeyID }}',
        secretAccessKey: '{{ field.s3AccessKeySecret }}'
      }
    })
  {% endset %}
  {{ add_setting(tableSingleName ~ '_File_Start', clientDefinition) }}
  {% set preAddInsert %}
    const tmp{{ fieldName }} = req.files?.find(f => f.fieldname === '{{ fieldName }}')
    if ( tmp{{ fieldName }} ) {
      const uniqueFileName = Date.now() + '-' + tmp{{ fieldName }}.originalname
      req.body['{{ fieldName }}'] = `https://{{ field.s3Bucket }}.s3.amazonaws.com/${uniqueFileName}`
      const poc = new PutObjectCommand({
        Bucket: '{{ field.s3Bucket }}',
        Key: uniqueFileName,
        Body: tmp{{ fieldName }}.buffer,
        ContentType: tmp{{ fieldName }}.mimetype
      })
    
      try {
        const response = await client.send(poc)
      } catch (caught) {
        console.error('caught', caught)
      }

      {% if field.autogeneratethumbnail %}{{ thumbnailGeneration }}{% endif %}
    }
  {% endset %}
  {{ add_setting(tableSingleName ~ '_Pre_Add', preAddInsert) }}
{% else %}
  {{ add_setting(tableSingleName ~ '_File_Start', 'import { writeFileSync, renameSync } from "fs"')}}
  const tmp{{ fieldName }} = req.files?.find(f => f.fieldname === '{{ fieldName }}')
  if ( tmp{{ fieldName }} ) {
    const uniqueFileName = Date.now() + '_' + tmp{{ fieldName }}.originalname
    writeFileSync(`./public/img/${uniqueFileName}`, tmp{{ fieldName }}.buffer)
    req.body.{{ fieldName }} = `/img/${uniqueFileName}`

    {% if field.autogeneratethumbnail %}{{ thumbnailGeneration }}{% endif %}
  }
  const {{ fieldName }} = typeof req.body.{{ fieldName }} !== 'undefined' ? req.body.{{ fieldName }} : null 
{% endif %}