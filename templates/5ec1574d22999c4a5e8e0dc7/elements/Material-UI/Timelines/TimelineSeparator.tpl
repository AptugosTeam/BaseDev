/*
path: TimelineSeparator.tpl
completePath: elements/Material-UI/Timelines/TimelineSeparator.tpl
type: file
unique_id: dfS722oZ
icon: ico-timeline-separator
sourceType: javascript
options:
  - name: connector
    display: Also Connector the First
    type: checkbox
    options: ''
    settings:
      default: false
  - name: userIcon
    display: Want to Use an Icon?
    type: checkbox
    options: ''
    settings:
      default: false
  - name: icon
    display: Icon Name to Use (Material-UI)
    type: text
    options: ''
    settings:
      propertyCondition: userIcon
      condition: '"true"'
      active: true


children: []
*/
{% set bpr %}
import TimelineSeparator from '@mui/lab/TimelineSeparator'
import TimelineConnector from '@mui/lab/TimelineConnector'
import TimelineDot from '@mui/lab/TimelineDot'
import {{element.values.icon}}Icon from '@mui/icons-material/{{element.values.icon}}'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<TimelineSeparator>
    {% if element.values.connector %}
    <TimelineConnector />
    {% endif %}
    <TimelineDot>
        {% if element.values.connector and element.values.userIcon %}
        <{{ element.values.icon }}Icon />
        {% endif %}
    </TimelineDot>
    <TimelineConnector />
</TimelineSeparator>