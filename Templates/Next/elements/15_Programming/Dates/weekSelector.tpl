/*
path: weekSelector.tpl
type: file
unique_id: weekselector
icon: ico-week
sourceType: javascript
options:
  - name: class
    display: ClassName
    type: styles
    options: ''
children: []
settings:
  - name: Packages
    value: |-
      "moment": "latest",
      "react-moment": "latest",
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
{% include includeTemplate('useState.tpl') with { 'element': { 'values': { 'variableName': 'selectedWeek', 'defaultValue': 'new Date()' }}} %}
<div
  title="{{ element.name }}"
  {% if element.values.class %}className={ {{element.values.class|raw}} }{% endif %}
>
<IconButton
  onClickCapture={(e) => {
    setselectedWeek(new Date(selectedWeek.setDate(selectedWeek.getDate() - 7)))
  }}
>
  {% include includeTemplate('Icon.tpl') with { 'element': { 'values': { 'icon': 'ic:twotone-chevron-left' }}} %}
</IconButton>
<Moment interval={0} format="DD/MM/YYYY">{getMonday(selectedWeek)}</Moment>
<Moment interval={0} format="DD/MM/YYYY">{getSaturday(selectedWeek)}</Moment>
<IconButton
  onClickCapture={(e) => { setselectedWeek(new Date(selectedWeek.setDate(selectedWeek.getDate() + 7))) }}
>
  {% include includeTemplate('Icon.tpl') with { 'element': { 'values': { 'icon': 'ic:twotone-chevron-right' }}} %}
</IconButton>
</div>