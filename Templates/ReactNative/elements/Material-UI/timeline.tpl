/*
path: timeline.tpl
type: file
unique_id: kIUxePN0
icon: ico-timeline
sourceType: javascript
childs:
  - name: TimeLine Item
    element: TimelineItem
children: []
settings:
  - name: Packages
    value: "'@mui/lab' : 'latest'"
options:
  - name: align
    display: Align
    type: dropdown
    options: alternate;left;right
*/

{% set bpr %}
import Timeline from '@mui/lab/Timeline'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Timeline {% if element.values.align %}align={{ element.values.align | textOrVariable }}{% endif %}>{{ content | raw }}</Timeline>
    