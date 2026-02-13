/*
path: popupDialog.tpl
type: file
unique_id: Rm5aRBZI
icon: ico-pop-up-dialog
options:
  - name: open
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
  - name: avoidPortal
    display: Disable Portal Handling
    type: checkbox
    settings:
      advanced: true
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
{% if not element.values.avoidPortal %}import { Portal } from 'react-native-paper'{% endif %}
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if not element.values.avoidPortal %}<Portal>{% endif %}
  <Modal
    animationType="fade"
    transparent={true}
    {% if element.values.open %}visible={ {{ element.values.open }} }{% endif %}
    {% if element.values.onclose %}
      onDismiss={() => {{ element.values.onclose }} }
      onRequestClose={() => {{ element.values.onclose }} }
    {% endif %}
  >
    {% if not element.values.avoidPortal %}
      <TouchableOpacity
        {% if element.values.dimClass %}style={ {{ element.values.dimClass }}}{% endif %}
        {% if element.values.onclose %}onPress={ {{ element.values.onclose | functionOrCall }} }{% endif %}
      >
        <TouchableOpacity {% if element.values.viewClass %}style={ {{ element.values.viewClass }}}{% endif %} activeOpacity={1}>
    {% endif %}
        {{ content | raw }}
    {% if not element.values.avoidPortal %}
      </TouchableOpacity>
    </TouchableOpacity>
    {% endif %}
  </Modal>
{% if not element.values.avoidPortal %}</Portal>{% endif %}