/*
path: baseHook.tsx
unique_id: E3oL1XmD
internalUse: true
*/
import React from 'react'
{% for delay in delayed %}
{% for specificDelay in delay.bpr %}
{{ specificDelay }}
{% endfor %}
{% endfor %}

const use{{ element.values.name }} = ({{ element.values.parameters }}) => {
  {% for delay in delayed %}
    {% for specificDelay in delay.ph %}
      {{ specificDelay }}
    {% endfor %}
  {% endfor %}

  {% for child in element.children %}
    {% if child.value == 'hookHeader' %}
      {{ child.rendered }}
    {% endif %}
    {% if child.value == 'hookBody' %}
      {{ child.rendered }}
    {% endif %}
  {% endfor %}
  {% if element.values.return %}
  return {{ element.values.return }}
{% endif %}
}

export default use{{ element.values.name }}