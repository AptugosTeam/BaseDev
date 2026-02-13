/*
path: ActiveBoxes.tpl
completePath: elements/Layouts/ActiveBoxes/ActiveBoxes.tpl
unique_id: geLuluT8
icon: f:activeBoxes.svg
options:
  - name: activeBox
    display: Default Active Box
    type: text
    settings:
      default: '1'
  - name: className
    display: className
    type: styles
  - name: variableName
    display: State Variable Name
    type: text
    advanced: true
    settings:
      default: 'activeBoxesActive'
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
{% set variableName = element.values.variableName | default('activeBoxesActive') %}
const [{{variableName}}, set{{variableName}}] = React.useState<any>({{ element.values.activeBox|default(1)}})
{% endset %}
{{ save_delayed('ph',ph) }}
<Grid container className={ {{ element.values.className|default('classes.activeBoxesLayout') }} }>
{{ content | raw }}
</Grid>