/*
path: componentHeader.tpl
keyPath: elements/Programming/componentHeader.tpl
unique_id: OsPh329x
usesDelays: [ph]
icon: header
order: 16
*/
{{ add_setting('capturedImportsBPR', capturedImportsBPR)}}
{% set capturedImportsPH %}
{% for delay in delayed %}
  {% for specificDelay in delay.ph %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
{% endset %}
{{ capturedImportsPH }}
{{ content | raw }}