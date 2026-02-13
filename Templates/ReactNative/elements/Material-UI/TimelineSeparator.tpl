/*
path: TimelineSeparator.tpl
type: file
unique_id: dfS722oZ
icon: ico-timeline-separator
sourceType: javascript
children: []
*/
{% set bpr %}
import TimelineSeparator from '@mui/lab/TimelineSeparator'
import TimelineConnector from '@mui/lab/TimelineConnector'
import TimelineDot from '@mui/lab/TimelineDot'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<TimelineSeparator>
    <TimelineDot />
    <TimelineConnector />
</TimelineSeparator>