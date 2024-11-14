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



{% for child in element.children %}
  {% if child.value == 'hookHeader' %}
    {% set macucas = child.rendered %}
    {{ add_setting('macucas', macucas) }}
  {% endif %}
{% endfor %}

export const {{ insert_setting('hookName') | raw }} = ({{ insert_setting('hookParameters') }}) => {

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