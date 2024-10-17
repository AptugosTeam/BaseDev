/*
path: bpr.tpl
type: file
unique_id: 9NRSTvDR
icon: ico-field
sourceType: javascript
internalUse: true
prevent_delete: true
children: []
*/
import React, { FunctionComponent } from 'react'
import { useRouter } from 'next/router'
import { Metadata } from 'next'

{% for delay in delayed %}
  {{ delay }}
{% endfor %}

export const metadata: Metadata = {
  title: 'Invoices | Acme Dashboard',
}

{{ content | raw }}
