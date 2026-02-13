/*
path: Progress.tpl
completePath: elements/Experimental/Progress.tpl
type: file
unique_id: DaMiyMaX
icon: f:../Z-Icons/radialBarChart.svg
options:
  - name: varName
    display: Variable Name (Open Progress)
    type: text
    options: ''
  - name: CircularProgress
    display: Use circular progress
    type: checkbox
    settings:
      default: true
children: []
*/
{% set bpr %}
import Backdrop from '@mui/material/Backdrop'
import CircularProgress from '@mui/material/CircularProgress'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const [{{ element.values.varName }}, set{{ element.values.varName }}] = React.useState(false)
{% endset %}
{{ save_delayed('ph', ph ) }}
<Backdrop
  open={ {{ element.values.varName }} }
  sx={ { color: '#fff', zIndex: (theme) => theme.zIndex.drawer + 1 } }
>
{% if element.values.CircularProgress %}
  <CircularProgress color="inherit" />
{% endif %}
{{ content | raw }}
</Backdrop>