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
settings:
  - name: BackendPackages
    value: '"@afipsdk/afip.js": "1.1.1", "qrcode": "1.5.3"'
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

