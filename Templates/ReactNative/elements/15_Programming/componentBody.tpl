/*
path: componentBody.tpl
keyPath: elements/Programming/componentBody.tpl
unique_id: NPR2te6M
usesDelays: [ph]
*/
{% set capturedImportsPH %}
{% for delay in delayed %}
  {% for specificDelay in delay.ph %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
{% endset %}
{{ add_setting('capturedImportsPH', capturedImportsPH)}}
{{ content | raw }}