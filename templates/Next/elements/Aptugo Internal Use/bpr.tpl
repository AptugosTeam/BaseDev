/*
path: bpr.tpl
type: file
unique_id: 9NRSTvDR
icon: ico-before
sourceType: javascript
internalUse: true
prevent_delete: true
children: []
*/
import React, { FunctionComponent } from 'react'
import { useRouter } from 'next/router'
// Rendering BPR
{% for delay in delayed %}
  {{ delay }}
{% endfor %}

// Rendering BPR CONTENT
{{ content | raw }}