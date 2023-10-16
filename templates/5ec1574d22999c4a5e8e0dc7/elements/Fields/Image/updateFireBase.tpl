/*
path: updateFireBase.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Fields/Image/updateFireBase.tpl
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
        "type": "service_account",
        "project_id": "rtadmin-789e3",
        "private_key_id": "38b53afbfa18da38f0341e639f891cf69ddd0754",
        "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDLJaXq32eWqZZM\nujXMvsEZXWosb/inZzmIqZKgmSyQKzgzFCuVQtVpOKwNPVc9onH7orgb/IP2lrhc\n6ySJJO2nh7/ZmrerO8Ps5OID7cIyXUFXpgJTfWF41BykuQnY7sqy0p56zPaoJOgT\nuoj/o6lK4GVqRIAkgqZ5PywTn2iUMNuJAuvGPGLHO9AlQ0UdXXAnYQIcYxEacaGW\nD2vF5mvuBin1MCwxjk1azotdr7dKpDYVjxxJaNdMR6pMqTt5n4TkaOsqNCMzU+tb\n6p4Pe6r3C1+f1wzRd88Z5500TsCpOIxN6kwgamfwesXa06JW6haDAOT1pfyCU7bv\nq+sSPe5NAgMBAAECggEAWuC+trG2X5oCGNT8mFmFfNljU/nLXOg6vr5NT/b2DpCn\nFYKidKVvXyDxJwMX8gSnxRBoGG0Ag+GtHDQ9JfUVM+rwkmI6ZCnaXjGOQn+sbmd1\ngcZMKBlg73LEVZRJqXg5yYGbUAg9F79a6uh5vRLz+wEjnUSDptGjs33lM+oOGKxu\nlFoN3kBy3cPRIwRDBo7PBGPmE2GPBUUTVjPSYJKQIgM86/2I9gn8IZ7RwKx/BCSp\n+B02rZlDerKrwkm9e4Loryg4SnatdA6zdrcnZJYmgTW7PLBdm1A8QTLPuKDfxh2m\ng+aSWn30eVsRBokeQXZpLMmbFMTGXZZb2aie/e61aQKBgQDo5pON0WNCCxXteNv0\n0BIHCZHryzMW6YVsRHtlZ2itIn1rBHd64e0vYQACxUmtAQkvmKNFSMviKc4q4Ffm\n8PCq+2A1Z4N+bVw90HK2KPUaEvxcb96If6uGT5GTPBuHkPHiF/38b5ITKsme7m1V\nOLWQUnbM7RHq3Cfhpjz+1l8fxwKBgQDfS54ZD0AebYm8H7Q5LEE3LWVgH/pcPg31\n07mRFGJ1++WFrwTlUlP2CjJldntiLTZhltO3MabQq7zeXV+HufrDm81AQknjW1DD\nqK4B44In1cD7GRjJg25eU/m3ylXVH8Xh2pQeFa13g3TPzPa4CwG7955V3n4Anm2x\njldA+vFpSwKBgQDNrPKZx1Q0ur1+ncEBjc6d0GHBLg3MKiXd2wxuHMhgPZksrSEm\nr+ZadPshd0D9O3D1S4LEaOlErU6Yps558EVZee0YvHVvbPyMykzDeaAairG6oECR\nos3DKvmQYQCe0+4IkM+H4q/JpXuwkzaSkCYncevgRWwRUKMXr0smcgJHeQKBgEdV\n+A8XcSuHYQ5JrqDpQ3hmN1HLRYd8h6c2Wb1AnugEbmIT9ONyNsKOpWUGwgouWYY5\n0i9fXGSjyPXdLKzGvJcLSjoyMzrALIAlflm6HhWt0zYk4WdXZsYZ29hceqlYujYa\nR2GJGV7qD0Jnv5YyZf5v8BSMvQJjmrWzvKpUwRUbAoGAAKFzxuB70UGJiXMIT9jl\nQHDqKQ4gWymVGFjlQijYbcZUtr/GBATkV/r7Ii3zo8DN8s5Fju3bzBXUW67N/bsM\nYZGUh+U/eq/hHWHfCCbbiykbgfhiX4/ywhh0r8iNLBXN5sCzCxWXAI5Ibrt/DCkn\naNKq3thfya7yeyS/+6N2RfI=\n-----END PRIVATE KEY-----\n",
        "client_email": "google-storage@rtadmin-789e3.iam.gserviceaccount.com",
        "client_id": "109174962818457015196",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/google-storage%40rtadmin-789e3.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
      },
      projectId: 'rtadmin-789e3',
    })

    const fileStream = new stream.PassThrough()
    const fileName = options.req.files.icon.name
    fileStream.end(options.req.files.icon.data)
    
    const bucket = storage.bucket('rtadmin-789e3.appspot.com');
    const file = bucket.file(fileName)

    fileStream.pipe(file.createWriteStream())
      .on('error', (err) => {
        console.error('Error uploading image:', err);
        res.status(500).json({ error: 'Image upload failed' });
      })
      .on('finish', async () => {
        const response = await storage.bucket('rtadmin-789e3.appspot.com').file(fileName).makePublic();
        resolve('Image uploaded successfully');
      })

    updatedData['{{ columnName }}'] = 'https://rtadmin-789e3.appspot.com.storage.googleapis.com/' + options.req.files.{{ columnName }}.name
  {% else %}
    if (!fs.existsSync(`${options.req.app.get('filesFolder')}`)) fs.mkdirSync(`${options.req.app.get('filesFolder')}`, { recursive: true })
    fs.writeFileSync(`${options.req.app.get('filesFolder')}/${options.req.files.{{ field.column_name | friendly }}.name}`, options.req.files.{{ field.column_name | friendly }}.data)
    updatedData['{{ field.column_name | friendly }}'] = options.req.files.{{ field.column_name | friendly }}.name
  {% endif %}
}
