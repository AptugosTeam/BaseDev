/*
path: alertMessage.tpl
type: file
unique_id: QWGbhsNv
icon: ico-field
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
{{ content | raw }}