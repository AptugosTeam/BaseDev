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
"use client"
import React, { FunctionComponent } from 'react'
import theme from '/src/app/globals.module.scss'
const classes = theme // Backward compatibility. Will be removed at 2.5

{% for delay in delayed %}
  {{ delay }}
{% endfor %}
{{ content | raw }}