/*
path: listItemButton.tpl
completePath: elements/Material-UI/Lists/listItemButton.tpl
type: file
unique_id: oajk9f4g
icon: f:list.svg
sourceType: javascript
children: []
options:
  - name: href
    display: Link URL
    type: text
  - name: alignItems
    display: Align Items
    type: dropdown
    options:
      return [['center', 'Center'],['flex-start', 'Flex-Start']]
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: separator
    display: Optionals Properties
    type: separator
  - name: dense
    display: dense
    type: checkbox
  - name: disabled
    display: disabled
    type: checkbox
  - name: disableGutters
    display: Disable Padding
    type: checkbox
    options: ''
  - name: separator
    display: Accordion Type (Adv. Properties)
    type: separator
  - name: collapse
    display: Active Accordion Type
    type: checkbox
    advanced: true
  - name: onClick
    display: onClick
    type: function
    settings:
      propertyCondition: collapse
      condition: true
      active: true
    advanced: true
  - name: useState
    display: Use an Variable
    type: text
    settings:
      propertyCondition: collapse
      condition: true
      active: true
    advanced: true
*/
{% set bpr %}
import ListItemButton from '@mui/material/ListItemButton'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% if element.values.collapse == true %}
  {% set bpr %}
  import ExpandLess from '@mui/icons-material/ExpandLess';
  import ExpandMore from '@mui/icons-material/ExpandMore';
  {% endset %}
  {{ save_delayed('bpr', bpr ) }}
  {% set ph %}
  const [open, setOpen] = React.useState(false);

  const handleClick = () => {
    setOpen(!open);
  };
  {% endset %}
  {{ save_delayed('ph', ph ) }}
{% endif %}

<ListItemButton 
  {% if element.values.href %}
    href={{element.values.href | textOrVariable}} component="a" 
  {% endif %}
  {% if element.values.alignItems %}
    alignItems='{{ element.values.alignItems }}'
  {% endif %}
  {% if element.values.className %}
    classes={ {{ element.values.className }} }
  {% endif %}
  {% if element.values.dense %}
    dense={true}
  {% endif %}
  {% if element.values.disabled %}
    disabled={true}
  {% endif %}
  {% if element.values.disablePadding %}
    disablePadding={true}
  {% endif %}
  {% if element.values.collapse %}
    onClick={ {{element.values.onClick|default('handleClick') | functionOrCall}} }
  {%endif%}
>
{% if element.values.collapse %}
  { {% if element.values.useState %}
      {{element.values.useState}}
    {% else %}
      open
    {% endif %} ? <ExpandLess /> : <ExpandMore /> }
{% endif %}
  {{ content | raw }}
</ListItemButton>