/*
path: Pagination.tpl
completePath: elements/Material-UI/Pagination.tpl
icon: ico-pagination
sourceType: javascript
unique_id: efevXTy7
children: []
options:
  - name: count
    display: Pages Count
    type: text
    options: ''
    settings:
      active: true
      default: '10'
  - name: boundaryCount
    display: Boundary Count
    type: text
    settings:
      active: true
      default: '1'
  - color: color
    display: Color
    type: dropdown
    options: primary;secondary;standard
    settings:
      active: true
      default: 'standard'
  - name: onChange
    display: On Change
    type: function
    options: ''
*/
{% set bpr %}
import Pagination from '@mui/material/Pagination'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Pagination
  count={ {{ element.values.count|default(10) }}}
  {% if element.values.color %}color={ {{ element.values.color }} }{% endif %}
  {% if element.values.boundaryCount %}boundaryCount={ {{ element.values.boundaryCount }} }{% endif %}
  {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
/>
