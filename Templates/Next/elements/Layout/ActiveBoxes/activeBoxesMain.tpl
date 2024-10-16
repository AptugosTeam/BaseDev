/*
path: activeBoxesMain.tpl
unique_id: Avpcw8C8
icon: f:activeBoxesMain.svg
*/
{% set bpr %}
import Grid from '@mui/material/Grid'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import Paper from '@mui/material/Paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.children %}
  {% set columns = element.children|length %}
  <Grid item xs={12} md={12}>
    <Paper elevation={1}>
      {% for child in element.children %}
        {activeBoxesActive === {{ loop.index }} && (
          {{ child.rendered | raw }}
        )}
      {% endfor %}
    </Paper>
  </Grid>
{% endif %}
