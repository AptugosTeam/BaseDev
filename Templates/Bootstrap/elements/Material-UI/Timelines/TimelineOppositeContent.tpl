/*
path: TimelineOppositeContent.tpl
completePath: elements/Material-UI/Timelines/TimelineContent.tpl
type: file
unique_id: iJ1XSZ6D
icon: ico-timeline-opposite-content
sourceType: javascript
children: []
*/
{% set bpr %}
import TimelineOppositeContent from '@mui/lab/TimelineOppositeContent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<TimelineOppositeContent>{{ content | raw }}</TimelineOppositeContent>
