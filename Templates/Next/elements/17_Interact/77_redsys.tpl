/*
path: redsysEasy.tpl
unique_id: WV1D3zrU
options:
  - name: devkey
    display: Redsys Dev Key
    type: text
    options: ''
  - name: prodkey
    display: Redsys Production Key
    type: text
    options: ''
settings:
  - name: Packages
    value: '"redsys-easy": "^5.2.5",'
children: []
*/
{% set ENV %}
REDSYS_DEV_KEY={{ element.values.devkey }}
REDSYS_PROD_KEY={{ element.values.prodkey }}
{% endset %}
{{ add_setting('EnvFile', ENV) }}
