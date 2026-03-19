/*
path: addPromise.tpl
type: file
unique_id: uGLTtaIE
icon: field
children: []
*/

{% if table.beforeCreate %}{{ table.beforeCreate }}{% endif %}
{{ table.name | friendly | lower }}.createAsPromise({ req, res }).then(result => {
    if (callback) callback(result)
    else res.send(result)  
})
