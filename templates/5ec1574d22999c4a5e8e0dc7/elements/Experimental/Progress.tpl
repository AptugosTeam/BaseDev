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
  - name: backdropColor
    display: Backdrop Color (rgba)
    type: text
    options: ''
    settings:
      default: 'rgba(0, 0, 0, 0.5)'    
  - name: progressColor
    display: Circular Progress Color (hexadecimal)
    type: text
    options: ''
    settings:
      default: 'inherit'
  - name: progressSize
    display: Circular Progress Size (width and height - px)
    type: text
    options: ''
    settings:
      default: '40'
  - name: showLabel
    display: Show Label
    type: checkbox
    settings:
      default: false    
children: []
*/
{% set bpr %}
import Backdrop from '@mui/material/Backdrop'
import CircularProgress from '@mui/material/CircularProgress'
import Typography from '@mui/material/Typography'
import Box from '@mui/material/Box'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const [{{ element.values.varName }}, set{{ element.values.varName }}] = React.useState(false)
{% endset %}
{{ save_delayed('ph', ph ) }}
<Backdrop
  open={ {{ element.values.varName }} }
  sx={ { color: '#fff', zIndex: (theme) => theme.zIndex.drawer + 1, backgroundColor: '{{ element.values.backdropColor | default('rgba(0, 0, 0, 0.5)') }}' } }
>
  <Box position="relative" display="inline-flex">
    {% if element.values.CircularProgress %}
      <CircularProgress 
        {% if element.values.progressColor %}
          sx={ { color: '{% if element.values.progressColor == 'default' %}inherit{% else %}{{ element.values.progressColor }}{% endif %}' } }
        {% endif %}
        size={ {{ element.values.progressSize | default('40') }} }
      />
    {% endif %}
    {% if element.values.showLabel %}
      <Box
        top={0}
        left={0}
        bottom={0}
        right={0}
        position="absolute"
        display="flex"
        alignItems="center"
        justifyContent="center"
      >
        <Typography variant="caption" component="div" color="textSecondary">
          0%
        </Typography>
      </Box>
    {% endif %}
  </Box>
  {{ content | raw }}
</Backdrop>