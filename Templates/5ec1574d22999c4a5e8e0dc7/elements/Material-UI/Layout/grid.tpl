/*
path: grid.tpl
completePath: elements/Material-UI/grid.tpl
unique_id: 7BJs3nUt
children: []
calculatedName: >-
  function (ele) { 
    try {
      if (ele.values.container && ele.values.item) {
        return `${ele.name} item container`
      }
      if (ele.values.container) {
        return `${ele.name} container`
      }
      if (ele.values.item) {
        return `${ele.name} item`
      }
    } catch(e) {
      return ele.name
    }
  }
options:
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: container
    display: Is a container
    type: checkbox
    options: ''
    settings:
      default: false
  - name: justify
    display: Justify
    type: dropdown
    options: flex-start;center;flex-end;space-between;space-around;space-evenly
    settings:
      propertyCondition: container
      condition: true
  - name: align
    display: Align
    type: dropdown
    options: flex-start;center;flex-end;stretch;baseline
    settings:
      propertyCondition: container
      condition: true
  - name: direction
    display: Direction
    type: dropdown
    options: column;column-reverse;row;row-reverse
    settings:
      propertyCondition: container
      condition: true
  - name: wrap
    display: Wrap
    type: dropdown
    options: nowrap;wrap-reverse;wrap
    settings:
      propertyCondition: container
      condition: true

  - name: spacing
    display: Spacing
    type: text
    settings:
      propertyCondition: container
      condition: true
  - name: gap
    display: Gap
    type: text
    settings:
      propertyCondition: container
      condition: true

  - name: item
    display: Is an item
    type: checkbox
    options: ''
    settings:
      default: false
  - name: extrasmallcolumns
    display: Columns (extra small)
    type: text
    settings:
      propertyCondition: item
      condition: true
  - name: smallcolumns
    display: Columns (small)
    type: text
    settings:
      propertyCondition: item
      condition: true
  - name: midcolumns
    display: Columns (mid)
    type: text
    settings:
      propertyCondition: item
      condition: true
  - name: largecolumns
    display: Columns (large)
    type: text
    settings:
      propertyCondition: item
      condition: true
helpText: >-
  The Material Design responsive layout grid adapts to screen size and
  orientation, ensuring consistency across layouts.
icon: ico-grid
*/
{% set bpr %}
import Grid from '@mui/material/Grid'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Grid
  {% if element.values.container %}
    container
    {% if element.values.align %}alignItems="{{ element.values.align }}"{% endif %}
    {% if element.values.justify %}justifyContent="{{ element.values.justify }}"{% endif %}
    {% if element.values.direction %}direction="{{ element.values.direction }}"{% endif %}
    {% if element.values.wrap %}wrap="{{ element.values.wrap }}"{% endif %}
    {% if element.values.spacing %}spacing={ {{ element.values.spacing }} }{% endif %}
    {% if element.values.gap %}gap={ {{ element.values.gap }} }{% endif %}
  {% endif %}
  {% if element.values.item %}
    item
    {% if element.values.extrasmallcolumns %}xs={ {{ element.values.extrasmallcolumns }} }{% endif %}
    {% if element.values.smallcolumns %}sm={ {{ element.values.smallcolumns }} }{% endif %}
    {% if element.values.midcolumns %}md={ {{ element.values.midcolumns }} }{% endif %}
    {% if element.values.largecolumns %}lg={ {{ element.values.largecolumns }} }{% endif %}
  {% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
>
{{ content | raw }}
</Grid>


