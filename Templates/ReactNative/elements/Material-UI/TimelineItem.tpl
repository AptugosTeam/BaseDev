/*
path: TimelineItem.tpl
type: file
unique_id: FKm6KFkt
icon: ico-timeline-item
sourceType: javascript
options:
  - name: onClick
    display: On Click
    type: text
    options: ''
children: []
*/
{% set bpr %}
import TimelineItem from '@mui/lab/TimelineItem'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<TimelineItem
    {% if element.values.onClick %}onClickCapture={{ element.values.onClick }}{% endif %}
>
    {{ content | raw }}
</TimelineItem>
