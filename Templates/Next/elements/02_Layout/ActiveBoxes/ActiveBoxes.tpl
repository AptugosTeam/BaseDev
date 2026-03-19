/*
path: ActiveBoxes.tpl
unique_id: geLuluT8
icon: f:activeBoxes.svg
*/
{% set bpr %}
import clsx from 'clsx'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import Grid from '@mui/material/Grid'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const [activeBoxesActive, setActiveBoxesActive] = React.useState<any>(1)
{% endset %}
{{ save_delayed('ph',ph) }}

<Grid container className={classes.activeBoxesLayout}>
{{ content | raw }}
</Grid>