/*
path: popupDialog.tpl
type: file
unique_id: Rm5aRBZI
icon: ico-pop-up-dialog
options:
  - name: open
    display: Open Variable
    type: text
    options: ''
  - name: onclose
    display: On Close
    type: text
    options: ''
  - name: maxWidth
    display: Max Width
    type: dropdown
    options: false;'xs';'sm';'md';'lg';'xl'
  - name: className
    display: className
    type: styles
sourceType: javascript
childs:
  - name: Title
    element: dialogTitle
  - name: Content
    element: dialogContent
  - name: Actions
    element: dialogActions
children: []
*/
{% set bpr %}
import Dialog from '@mui/material/Dialog'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Dialog
  open={ {{ element.values.open }} }
  {% if element.values.onclose %}onClose={ {{ element.values.onclose | functionOrCall }} }{% endif %}
  maxWidth={ {{ element.values.maxWidth }} }
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
>
{{ content | raw }}
</Dialog>
