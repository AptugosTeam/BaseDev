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
  - name: disableEscapeKeyDown
    display: Disable Escape KeyDown close Popup
    type: checkbox
    settings:
      default: false
  - name: className
    display: className
    type: styles
  - name: TransitionProps
    display: Transition Props from MUI
    type: code
    advanced: true
  - name: disableScrollLock
    display: Disable Scroll Lock
    type: checkbox
    settings:
      default: false  
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
  open={ {{ element.values.open|default(element.values.visible) }} }
  {% if element.values.onclose %}onClose={ {{ element.values.onclose | functionOrCall }} }{% endif %}
  {% if element.values.maxWidth %}maxWidth={ {{ element.values.maxWidth }} }{% endif %}
  {% if element.values.disableEscapeKeyDown %}disableEscapeKeyDown={ {{ element.values.disableEscapeKeyDown|default("false") }} }{% endif %}
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
  {% if element.values.TransitionProps %} TransitionProps={ {{element.values.TransitionProps}} } {% endif %}
  {% if element.values.disableScrollLock %}disableScrollLock={ {{ element.values.disableScrollLock|default("false") }} }{% endif %}
>
{{ content | raw }}
</Dialog>
