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
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    settings:
      active: true
  - name: defaultPage
    display: Default Page
    type: variable
    options: ''
    advanced: true
  - name: shape
    display: shape
    type: dropdown
    options: circular;rounded
    settings:
      active: true
      default: 'circular'
  - name: hideNextButton
    display: Hide Next Button
    type: variable
    advanced: true
  - name: hidePrevButton
    display: Hide Previous Button
    type: variable
    advanced: true
  - name: size
    display: size
    type: dropdown
    options: small;medium;large
    settings:
      active: true
      default: 'medium'
  - name: style
    display: Extra Styles
    type: text
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
  {% if element.values.disabled %}disabled={ {{element.values.disabled}} }{% endif %}
  {% if element.values.defaultPage %}defaultPage={ {{element.values.defaultPage}} }{% endif %}
  {% if element.values.shape %}shape={ '{{element.values.shape}}' }{% endif %}
  {% if element.values.hideNextButton %}hideNextButton={ {{element.values.hideNextButton}} }{% endif %}
  {% if element.values.hidePrevButton %}hidePrevButton={ {{element.values.hidePrevButton}} }{% endif %}
  {% if element.values.size %}size={ '{{element.values.size}}' }{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
/>
