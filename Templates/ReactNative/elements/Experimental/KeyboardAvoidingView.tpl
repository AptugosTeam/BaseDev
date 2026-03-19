/*
path: KeyboardAvoidingView.tpl
completePath: elements/Experimental/KeyboardAvoidingView.tpl
type: file
unique_id: KAVra7rn
icon: ico-div
sourceType: javascript
options:
  - name: class
    display: ClassName
    type: text
    options: ''
  - name: behavior
    display: Behavior
    type: text
    options: ''
children: []
helpText: Basic Keyboard Avoiding View element
*/
{% set bpr %}
import { KeyboardAvoidingView } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<KeyboardAvoidingView
  {% if element.values.class %}style={ {{element.values.class}} }{% endif %}
  {% if element.values.behavior %}behavior={ {{element.values.behavior}} }{% endif %}
>
{{ content | raw }}
</KeyboardAvoidingView>