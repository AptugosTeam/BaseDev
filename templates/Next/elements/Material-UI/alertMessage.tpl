/*
path: alertMessage.tpl
type: file
unique_id: QWGbhsNv
icon: f:alertMessage.svg
helpText: >-
  An alert displays a short, important message in a way that attracts the user's
  attention without interrupting the user's task.
children: []
options:
  - name: severity
    display: Severity
    type: dropdown
    options: error;info;success;warning
  - name: title
    display: Title
    type: text
  - name: variant
    display: Variant
    type: dropdown
    options: standard;filled;outlined
*/
{% set bpr %}
import Alert from '@mui/material/Alert'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.title %}
{% set bpr %}
import AlertTitle from '@mui/material/AlertTitle'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% endif %}
<Alert
  variant='{{ element.values.variant|default('standard') }}'
{% if element.values.severity %}severity={{ element.values.severity | textOrVariable }}{% endif %}
>
{% if element.values.title %}<AlertTitle>{{ element.values.title }}</AlertTitle>{% endif %}
{{ content | raw }}</Alert>