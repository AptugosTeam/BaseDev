/*
path: hookHeader.tpl
keyPath: elements/Programming/hookHeader.tpl
unique_id: HokAhead
usesDelays: [ph]
helpText: Add declarations, state, or setup code at the top of the generated custom hook
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
