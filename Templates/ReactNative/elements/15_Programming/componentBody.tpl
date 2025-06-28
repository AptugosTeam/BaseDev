/*
path: componentBody.tpl
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Programming/componentBody.tpl
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