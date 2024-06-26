/*
path: activeBoxesTop.tpl
completePath: elements/Layouts/ActiveBoxes/activeBoxesTop.tpl
unique_id: rqa1TS3P
icon: f:activeBoxesTop.svg
options:
  - name: className
    display: className
    type: styles
  - name: activeClassName
    display: Active ClassName
    type: styles
*/
{% set parentElement = element.parent|elementData %}
{% set variableName = parentElement.values.variableName | default('activeBoxesActive') %}
{% set bpr %}
import Grid from '@mui/material/Grid'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import Button from '@mui/material/Button'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import Paper from '@mui/material/Paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.children %}
  {% set columns = element.children|length %}
  {% for child in element.children %}
    <Grid item xs={12} md={ {{ 12 / columns }} } className={
      clsx([
        {{ variableName }} === {{ loop.index }} && classes.active
        {% if element.values.className %},{{ element.values.className }}{% endif %},
        {% if element.values.activeClassName %}{{ variableName }} === {{ loop.index }} && {{ element.values.activeClassName }}{% endif %}
      ])
    }>
      <Button onClickCapture={(params) => { set{{ variableName }}( {{ loop.index }} ) } }>
        <Paper elevation={1} variant="elevation">
          {{ child.rendered | raw }}
        </Paper>
      </Button>
    </Grid>
  {% endfor %}
{% endif %}
