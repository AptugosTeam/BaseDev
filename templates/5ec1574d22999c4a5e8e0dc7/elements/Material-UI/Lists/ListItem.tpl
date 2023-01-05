/*
path: ListItem.tpl
completePath: elements/Material-UI/Lists/listItem.tpl
type: file
unique_id: b1KMWrIH
icon: f:ListItem.svg
sourceType: javascript
options:
  - name: flexDirection
    display: flexDirection
    type: dropdown
    options:
      return [['row', 'Row'], ['column', 'Column']]
  - name: onClick
    display: On Click
    type: text
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: separator
    display: Optionals Properties
    type: separator
  - name: selected
    display: Selected
    type: checkbox
  - name: disableGutters
    display: Disable Gutters
    type: checkbox
    options: ''
  - name: dense
    display: Dense
    type: checkbox
    options: ''
  - name: separator
    display: Advanced
    type: separator
    advanced: true
  - name: secondaryAction
    display: Checkbox Type
    type: checkbox
    advanced: true
  - name: onChange
    display: OnChange
    type: function
    settings:
      propertyCondition: secondaryAction
      condition: true
      active: true
    advanced: true
  - name: checked
    display: Checked
    type: text
    settings:
      propertyCondition: secondaryAction
      condition: true
      active: true
    advanced: true
children: []
*/
{% set bpr %}
import ListItem from '@mui/material/ListItem'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.secondaryAction %}
  {% set bpr %}
    import Checkbox from '@mui/material/Checkbox'
  {% endset %}
  {{ save_delayed('bpr',bpr) }}
{% endif %}
<ListItem
  {% if element.values.dense %}
    dense
  {% endif %}
  {% if element.values.disableGutters %}
    disableGutters={true}
  {% endif %}
  {% if element.values.className %}
    className={ {{ element.values.className }} }
  {% endif %}
  {% if element.values.onClick %}
    onClickCapture={ {{ element.values.onClick | functionOrCall}} }
  {% endif %}
  {% if element.values.selected %}
    selected={true}
  {% endif %}
  {% if element.values.secondaryAction %}
    secondaryAction={
      <Checkbox
        {% if element.values.onChange %}
          onChange={ {{element.values.onChange | functionOrCall}} } 
        {% endif %}
        {% if element.values.checked %}
          checked={ {{element.values.checked}} } 
        {% endif %}
      />
    }
  {% endif %}
  sx={ { flexDirection:'{{ element.values.flexDirection|default('column')}}' } }
>
{{ content | raw }}
</ListItem>