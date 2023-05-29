/*
path: popupDialog.tpl
type: file
unique_id: Rm5aRBZI
icon: ico-pop-up-dialog
sourceType: javascript
options:
  - name: visible
    display: Visible (boolean)
    type: text
  - name: onclose
    display: On Close
    type: function
  - name: dimClass
    display: Dimm Styles
    type: text
  - name: viewClass
    display: Popup Styles
    type: text
children: []
*/
{% set bpr %}
import {  Portal } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import { TouchableOpacity, Modal } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Portal>
  <Modal
    animationType="fade"
    transparent={true}
    visible={ {{ element.values.visible }}}
    onDismiss={ {{ element.values.onclose |functionOrCall }} }
    onRequestClose={ {{ element.values.onclose |functionOrCall }} }
  >
    <TouchableOpacity {% if element.values.dimClass %}style={ {{ element.values.dimClass }}}{% endif %} onPress={ {{ element.values.onclose |functionOrCall }} }>
      <TouchableOpacity {% if element.values.viewClass %}style={ {{ element.values.viewClass }}}{% endif %} activeOpacity={1} >
        {{ content | raw }}
      </TouchableOpacity>
    </TouchableOpacity>
  </Modal>
</Portal>
