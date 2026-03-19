/*
path: hookHeader.tpl
keyPath: elements/Programming/hookHeader.tpl
unique_id: HokAhead
usesDelays: [ph]
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