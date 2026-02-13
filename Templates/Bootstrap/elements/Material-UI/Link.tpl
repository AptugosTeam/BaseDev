/*
path: Link.tpl
type: file
unique_id: a0bW4rmi
completePath: elements/Material-UI/Link.tpl
icon: ico-link
internalUse: true
helpText: Simple Link that uses React Router
options:
  - name: innerText
    display: Text
    type: text
    options: ''
  - name: destination
    display: Destination
    required: true
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { NavLink } from 'react-router-dom'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<NavLink
  to={{ element.values.destination|textOrVariable|default("''") }}
  key='{{ element.unique_id }}'
>
  {% if element.values.innerText %}
    {{ element.values.innerText }}
  {% endif %}
  {{ content | raw }}
</NavLink>