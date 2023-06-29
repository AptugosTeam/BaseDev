/*
path: afip.tpl
completePath: elements/Experimental/Afip/afip.tpl
type: file
unique_id: afipErt8
icon: ico-field
options:
  - name: cuit
    display: CUIT
    type: text
    options: ''
  - name: cert
    display: Certificate
    type: text
    options: ''
  - name: key
    display: Key
    type: text
    options: ''
extraFiles:
  - source: 'elements/Experimental/Afip/999_afip.js'
    destination: 'back-end/app/services/afip.service.js'
  - source: 'elements/Experimental/Afip/999_afip.routes.js'
    destination: 'back-end/app/routes/afip.routes.js'
settings:
  - name: BackendPackages
    value: '"@afipsdk/afip.js": "0.7.10",'
  - name: ServerAddenum
    value: |-
      require('./app/routes/afip.routes.js')(app)
*/


{% set CUIT %}
const cuit = {{ element.values.cuit }};
{% endset %}

{{ add_setting('ClientCuit', CUIT) }}
