/*
path: insertCustomApiUrl.tpl
keyPath: elements/Programming/insertCustomApiUrl.tpl
unique_id: MWvH3abi
options:
  - name: customUrl
    display: ApiUrl
    type: text
*/
{% set url = element.values.customUrl %}
{% if element.values.customUrl %}{{ add_setting('customApiUrl', url) }}{% endif %}
