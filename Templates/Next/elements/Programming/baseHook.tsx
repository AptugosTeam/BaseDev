/*
path: baseHook.tsx
keyPath: elements\Programming\baseHook.tsx
unique_id: E3oL1XmD
internalUse: true
*/
import React from 'react'
import { useRouter } from 'next/router'
{% for delay in delayed %}
{% for specificDelay in delay.bpr %}
{ { specificDelay } }
{% endfor %}
{% endfor %}

export const AptugoHook = ({{ element.values.parameters }}) => {
  {% for child in element.children %}
  {% if child.value == 'hookHeader' %} 
    {{ child.rendered }}
  {% endif %}
  {% endfor %}

  {% for child in element.children %}
  {% if child.value == 'hookBody' %}
    {{ child.rendered }}
  {% endif %}
  {% endfor %}
  {% if element.values.return %}
    return {{ element.values.return }}
  {% endif %}

}