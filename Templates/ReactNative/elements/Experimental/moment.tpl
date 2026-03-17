/*
path: moment.tpl
type: file
unique_id: itDtErc5
icon: ico-moment
options:
  - name: dateToFormat
    display: Date to Format
    type: text
    options: ''
  - name: fromNow
    display: Show From Now
    type: checkbox
    options: ''
  - name: format
    display: Format
    type: text
    options: ''
  - name: className
    display: ClassName
    type: text
    options: ''
settings:
  - name: Packages
    value: '"date-fns": "^3.6.0",'
sourceType: javascript
children: []
*/
{% set bpr %}
import { formatDistance } from 'date-fns'
import { es } from 'date-fns/locale/es'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Text {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}>{formatDistance({{ element.values.dateToFormat }}, new Date(), { addSuffix: true, locale: es })}</Text>