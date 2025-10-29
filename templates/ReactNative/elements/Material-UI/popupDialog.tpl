/*
path: popupDialog.tpl
type: file
unique_id: Rm5aRBZI
icon: ico-pop-up-dialog
options:
  - name: visible
    display: Visible Variable
    type: text
    options: ''
  - name: onclose
    display: On Close
    type: text
    options: ''
  - name: dimClass
    display: ClassName (dimmed area)
    type: text
    options: ''
  - name: viewClass
    display: ClassName (dialog view area)
    type: text
    options: ''
  - name: customStructure
    display: Use custom structure
    type: checkbox
    options: ''
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
import { Portal, Dialog } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Portal>
  <Dialog
    visible={ {{ element.values.visible }} }
    onDismiss={() => {{ element.values.onclose }} }
    style={ {{ element.values.viewClass }} }
  >
    {% if not element.values.customStructure %}
      {{ content | raw }}
    {% else %}
      {{ content | raw }}
    {% endif %}
  </Dialog>
</Portal>
