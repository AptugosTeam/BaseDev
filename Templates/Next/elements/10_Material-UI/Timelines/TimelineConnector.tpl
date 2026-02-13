/*
path: TimelineConnector.tpl
completePath: >-
  /Users/Shared/Dev/BaseDev/Templates/Next/elements/10_Material-UI/Timelines/TimelineConnector.tpl
keyPath: elements/10_Material-UI/Timelines/TimelineConnector.tpl
unique_id: HpkefMSV
*/
{% set bpr %}
import TimelineConnector from '@mui/lab/TimelineConnector'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<TimelineConnector>
{{ content | raw }}
</TimelineConnector>