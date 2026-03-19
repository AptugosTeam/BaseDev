/*
path: dateFormat.tpl
keyPath: elements/15_Programming/Dates/dateFormat.tpl
unique_id: JO22y29T
options:
  - name: ISODate
    display: Format date in ISO format
    type: checkbox
  - name: DistanceFromNow
    display: Format as distance from now
    type: checkbox
settings:
  - name: Packages
    value: '"date-fns": "^4.1.0",'
*/
{% set bpr %}

import {
  {% if element.values.DistanceFromNow %}formatDistanceToNow{% endif %}
  {% if element.values.ISODate %}formatISO{% endif %}
} from 'date-fns'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.DistanceFromNow %}
  {formatDistanceToNow({{ content | raw }}, { addSuffix: true })}
{% endif %}
{% if element.values.ISODate %}
  {formatISO({{ content | raw }},{ representation: 'date' })}
{% endif %}