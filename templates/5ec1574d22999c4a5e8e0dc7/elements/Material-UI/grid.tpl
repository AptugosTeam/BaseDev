/*
path: grid.tpl
completePath: elements/Material-UI/grid.tpl
unique_id: 7BJs3nUt
children: []
options:
  - name: container
    display: Is the container
    type: checkbox
    options: ''
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: justify
    display: Justify
    type: dropdown
    options: flex-start;center;flex-end;space-between;space-around;space-evenly
  - name: align
    display: Align
    type: dropdown
    options: flex-start;center;flex-end;stretch;baseline
  - name: smallcolumns
    display: Columns (small)
    type: text
    options: flex-start;center;flex-end;stretch;baseline
  - name: midcolumns
    display: Columns (mid)
    type: text
    options: flex-start;center;flex-end;stretch;baseline
  - name: spacing
    display: Spacing
    type: text
    options: flex-start;center;flex-end;stretch;baseline
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
  {% else %}
    item
  {% if element.values.smallcolumns %}xs={ {{ element.values.smallcolumns }} }{% endif %}
  {% if element.values.midcolumns %}md={ {{ element.values.midcolumns }} }{% endif %}
  {% endif %}
  {% if element.values.spacing %}spacing={ {{ element.values.spacing }} }{% endif %}
  {% if element.values.className %}className={ {{ element.values.className }} }{% endif %}
>
{{ content | raw }}
</Grid>

