/*
icon: ico-paper
path: Paper.tpl
sourceType: javascript
unique_id: efavXTy7
options:
  - name: className
    display: ClassName
    type: styles
  - name: square
    display: Rounded Corners
    type: checkbox
  - name: variant
    display: Variant
    type: dropdown
    options: 
      return [['elevation', 'Elevation'],['outlined', 'Outlined']]
  - name: elevation
    display: Elevation
    type: dropdown
    options: 
      return [['1', 'Elevation 1'],['2', 'Elevation 2'],['3', 'Elevation 3'],['4', 'Elevation 4'],['5', 'Elevation 5'],['6', 'Elevation 6'],['7', 'Elevation 7'],['8', 'Elevation 8'],['9', 'Elevation 9'],['10', 'Elevation 10'],['11', 'Elevation 11'],['12', 'Elevation 12'],['13', 'Elevation 13'],['14', 'Elevation 14'],['15', 'Elevation 15'],['16', 'Elevation 16'],['17', 'Elevation 17'],['18', 'Elevation 18'],['19', 'Elevation 19'],['20', 'Elevation 20'],['21', 'Elevation 21'],['22', 'Elevation 22'],['23', 'Elevation 23'],['24', 'Elevation 24']]
    settings:
      propertyCondition: variant
      condition: elevation
      active: true
      default: 1
*/
{% set bpr %}
import Paper from '@mui/material/Paper'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Paper
  {% if not element.values.square %}
    square
  {% endif %}
  {% if element.values.variant %}
    variant='{{ element.values.variant }}'
  {% endif %}
  {% if element.values.variant != 'outlined' %}
    elevation={ {{ element.values.elevation }} }
  {% endif %}
  {% if element.values.className %}
    classes={ { root: {{ element.values.className }} } }
  {% endif %}
>
{{ content | raw }}
</Paper>