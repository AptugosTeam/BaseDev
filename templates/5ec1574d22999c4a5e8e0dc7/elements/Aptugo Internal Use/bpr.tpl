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
import baseClasses from '../components/Themes/layout.module.scss'
{% for delay in delayed %}
  {{ delay }}
{% endfor %}
{{ content | raw }}
