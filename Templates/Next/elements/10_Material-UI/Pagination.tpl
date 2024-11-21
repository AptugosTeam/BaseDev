/*
path: Pagination.tpl
completePath: elements/Material-UI/Pagination.tpl
icon: ico-pagination
sourceType: javascript
unique_id: efevXTy7
children: []
options:
  - name: count
    display: Number of Pages
    type: text
    settings:
      default: '10'
  - name: onChange
    display: On Change
    type: function
    settings:
      default: (e, page) => { console.log(page) }
  - name: color
    display: Color
    type: dropdown
    options: return [['primary','Primary'], ['secondary','Secondary'], ['standard', 'Standard']]
    settings:
      default: 'standard'
  - name: variant
    display: Variant
    type: dropdown
    options: return [['text', 'Text'], ['outlined', 'Outlined']]
    settings:
      default: 'text'
  - name: shape
    display: Icons Shape
    type: dropdown
    options: return [['circular', 'Circular'], ['rounded', 'Rounded']]
    settings:
      default: 'circular'
  - name: size
    display: Size
    type: dropdown
    options: return [['small', 'Small'], ['medium', 'Medium'], ['large', 'Large']]
    settings:
      default: 'medium'
  - name: separator
    display: Advanced Properties
    type: separator
    advanced: true
  - name: defaultPage
    display: Default Page
    type: variable
    advanced: true
  - name: boundaryCount
    display: Boundary Count
    type: text
    advanced: true
  - name: style
    display: Extra Styles
    type: text
    advanced: true
  - name: hideNextButton
    display: Hide Next Button
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: hidePrevButton
    display: Hide Previous Button
    type: checkbox
    advanced: true
    settings:
      default: false
  - name: disabled
    display: Disabled
    type: checkbox
    advanced: true
    settings:
      default: false
*/
{% set bpr %}
import Pagination from '@mui/material/Pagination'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Pagination
  count={ {{ element.values.count|default(10) }}}
  {% if element.values.color %}
    color={ '{{ element.values.color }}' }
  {% endif %}
  {% if element.values.variant %}
    variant={ '{{ element.values.variant }}' }
  {% endif %}
  {% if element.values.boundaryCount %}
    boundaryCount={ {{ element.values.boundaryCount }} }
  {% endif %}
  {% if element.values.onChange %}
    onChange={ {{ element.values.onChange | functionOrCall }} }
  {% endif %}
  {% if element.values.disabled %}
    disabled={ {{element.values.disabled}} }
  {% endif %}
  {% if element.values.defaultPage %}
    defaultPage={ {{element.values.defaultPage}} }
  {% endif %}
  {% if element.values.shape %}
    shape={ '{{element.values.shape}}' }
  {% endif %}
  {% if element.values.hideNextButton %}
    hideNextButton={ {{element.values.hideNextButton}} }
  {% endif %}
  {% if element.values.hidePrevButton %}
    hidePrevButton={ {{element.values.hidePrevButton}} }
  {% endif %}
  {% if element.values.size %}
    size={ '{{element.values.size}}' }
  {% endif %}
  {% if element.values.style %}
    sx={ { {{element.values.style}} } }
  {% endif %}
/>
