/*
path: TimelineContent.tpl
type: file
unique_id: z7tlw3DV
icon: ico-timeline-content
sourceType: javascript
children: []
*/
{% set bpr %}
import TimelineContent from '@mui/lab/TimelineContent'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<TimelineContent>{{ content | raw }}</TimelineContent>
