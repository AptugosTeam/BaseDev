/*
path: weekSelector.tpl
type: file
unique_id: weekselector
icon: f:weekSelector.svg
sourceType: javascript
options:
  - name: class
    display: ClassName
    type: styles
    options: ''
children: []
*/
{% set bpr %}
import ChevronLeftTwoToneIcon from '@mui/icons-material/ChevronLeftTwoTone'
import ChevronRightTwoToneIcon from '@mui/icons-material/ChevronRightTwoTone'
import IconButton from '@mui/material/IconButton'
import Moment from 'react-moment'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set ph %}
const getMonday = (d) => {
  d = new Date(d)
  var day = d.getDay(),
    diff = d.getDate() - day + (day === 0 ? -6 : 1)
  return new Date(d.setDate(diff))
}

const getSaturday = (d) => {
  d = new Date(d)
  var day = d.getDay(),
    diff = d.getDate() - day + (day === 0 ? -1 : 6)
  return new Date(d.setDate(diff))
}
{% endset %}
{{ save_delayed('ph', ph) }}
<div title="Selector Semana" className={ {{ element.values.class }} }>
<IconButton
  onClickCapture={(e) => {
    setselectedWeek(new Date(selectedWeek.setDate(selectedWeek.getDate() - 7)))
  }}
>
  <ChevronLeftTwoToneIcon />
</IconButton>

<Moment interval={0} format="DD/MM/YYYY">
  {getMonday(selectedWeek)}
</Moment>

<Moment interval={0} format="DD/MM/YYYY">
  {getSaturday(selectedWeek)}
</Moment>

<IconButton
  onClickCapture={(e) => {
    setselectedWeek(new Date(selectedWeek.setDate(selectedWeek.getDate() + 7)))
  }}
>
  <ChevronRightTwoToneIcon />
</IconButton>
</div>