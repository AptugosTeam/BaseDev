/*
path: bpr.tpl
type: file
unique_id: 9NRSTvDR
icon: ico-before
sourceType: javascript
internalUse: true
prevent_delete: true
children: []
usesDelays: [bprMax, bpr]
*/
{% for delay in delayed %}
  {% for specificDelay in delay.bprMax %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
import React, { FunctionComponent } from 'react'
import { useRouter } from 'next/router'
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}
{{ content | raw }}