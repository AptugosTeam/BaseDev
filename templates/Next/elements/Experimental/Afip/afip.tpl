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
    required: true
  - name: cert
    display: Certificate
    type: text
    required: true
  - name: key
    display: Key
    type: text
    required: true
  - name: production
    display: Production Mode
    type: checkbox
extraFiles:
  - source: 'elements/Experimental/Afip/999_afip.js'
    destination: 'back-end/app/services/afip.service.js'
  - source: 'elements/Experimental/Afip/cert.crt'
    destination: 'back-end/app/services/cert.crt'
  - source: 'elements/Experimental/Afip/key.key'
    destination: 'back-end/app/services/key.key'
  - source: 'elements/Experimental/Afip/999_afip.routes.js'
    destination: 'back-end/app/routes/afip.routes.js'
settings:
  - name: BackendPackages
    value: '"@afipsdk/afip.js": "0.7.10",'
  - name: ServerAddenum
    value: |-
      require('./app/routes/afip.routes.js')(app)
*/


{% if element.values.cuit %}
  {% set CUIT %}{{ element.values.cuit }}{% endset %}
  {{ add_setting('ClientCuit', CUIT) }}
{% endif %}

{% if element.values.cert %}
  {% set CERT %}{{ element.values.cert }}{% endset %}
  {{ add_setting('Certificate', CERT) }}
{% endif %}

{% if element.values.key %}
  {% set KEY %}{{ element.values.key }}{% endset %}
  {{ add_setting('Key', KEY) }}
{% endif %}

{% if element.values.production %}
  {% set PROD %}{{ element.values.production }}{% endset %}
  {{ add_setting('Production', PROD) }}
{% endif %}

