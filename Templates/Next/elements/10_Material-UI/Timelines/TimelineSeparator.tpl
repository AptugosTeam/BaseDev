/*
path: TimelineSeparator.tpl
completePath: elements/Material-UI/Timelines/TimelineSeparator.tpl
type: file
unique_id: dfS722oZ
icon: ico-timeline-separator
sourceType: javascript
children: []
*/
{% set bpr %}
import TimelineSeparator from '@mui/lab/TimelineSeparator'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<TimelineSeparator>{{ content | raw }}</TimelineSeparator>