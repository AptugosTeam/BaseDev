/*
path: activeBoxesTop.tpl
completePath: elements/Layouts/ActiveBoxes/activeBoxesTop.tpl
unique_id: rqa1TS3P
icon: f:activeBoxesTop.svg
*/
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
        activeBoxesActive === {{ loop.index }} && classes.active,
        {% if element.values.className %}{{ element.values.className }}{% endif %},
        {% if element.values.activeClassName %}activeBoxesActive === {{ loop.index }} && {{ element.values.activeClassName }}{% endif %}
      ])
    }>
      <Button onClickCapture={(params) => { setActiveBoxesActive( {{ loop.index }} ) } }>
        <Paper elevation={1} variant="elevation">
          {{ child.rendered | raw }}
        </Paper>
      </Button>
    </Grid>
  {% endfor %}
{% endif %}
