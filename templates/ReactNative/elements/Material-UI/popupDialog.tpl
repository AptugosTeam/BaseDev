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
import { Modal, TouchableOpacity } from 'react-native'
import { Portal } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Portal>
  <Modal
    animationType="fade"
    transparent={true}
    visible={ {{ element.values.visible }} }
    onDismiss={() => {{ element.values.onclose }} }
    onRequestClose={() => {{ element.values.onclose }} }
  >
    {% if not element.values.customStructure %}
    <TouchableOpacity
      style={ {{ element.values.dimClass }}}
      onPress={ {{ element.values.onclose | functionOrCall }} }
    >
      <TouchableOpacity style={ {{ element.values.viewClass }}} activeOpacity={1}>
        {{ content | raw }}
      </TouchableOpacity>
    </TouchableOpacity>
    {% else %}
    {{ content | raw }}
    {% endif %}
  </Modal>
</Portal>