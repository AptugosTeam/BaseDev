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
    display: ClassName (view area)
    type: text
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
import { Modal } from 'react-native'
import { Portal } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Portal>
  <Modal
    animationType="fade"
    transparent={true}
    visible={ {{ element.values.visible }} }
    onDismiss={ {{ element.values.onclose | functionOrCall }} }
    onRequestClose={ {{ element.values.onclose | functionOrCall }} }
  >
    <TouchableOpacity
      style={ {{ element.values.dimClass }}}
      onPress={ {{ element.values.onclose | functionOrCall }} }
    >
      <TouchableOpacity style={ {{ element.values.viewClass }}} activeOpacity={1}>
        {{ content | raw }}
      </TouchableOpacity>
    </TouchableOpacity>
  </Modal>
</Portal>