/*
path: baseHook.tsx
keyPath: elements\Programming\baseHook.tsx
unique_id: E3oL1XmD
internalUse: true
*/
import React from 'react'
import { Platform } from 'react-native'
{% for delay in delayed %}
{% for specificDelay in delay.bpr %}
{{ specificDelay }}
{% endfor %}
{% endfor %}



{% for child in element.children %}
{% if child.value == 'hookHeader' %}
{{ child.rendered }}
{% endif %}
{% endfor %}

export const use{{ element.values.name }} = ({{ insert_setting('hookParameters') }}) => {
  {% for child in element.children %}
  {% if child.value == 'hookHeader' %}
  {{ child.rendered }}
  {% endif %}
  {% endfor %}

  {{ insert_setting('macucas') | raw }}

  {% for child in element.children %}
  {% if child.value == 'hookBody' %}
  {{ child.rendered }}
  {% endif %}
  {% endfor %}
  {% if element.values.return %}
  return {{ element.values.return }}
{% endif %}

}