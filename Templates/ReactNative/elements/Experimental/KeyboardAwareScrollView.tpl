/*
path: KeyboardAwareScrollView.tpl
completePath: elements/Experimental/KeyboardAwareScrollView.tpl
type: file
unique_id: KASVa7xn
icon: ico-div
sourceType: javascript
options:
  - name: contentContainerStyle
    display: Content Container Style
    type: text
    options: ''
  - name: style
    display: Style
    type: text
    options: ''
  - name: enableOnAndroid
    display: Enable On Android?
    type: checkbox
    options: ''
  - name: extraScrollHeight
    display: Extra Scroll Height
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-keyboard-aware-scroll-view": "^0.9.5",'
children: []
helpText: Basic Keyboard Avoiding View element
*/
{% set bpr %}
import { KeyboardAwareScrollView } from 'react-native-keyboard-aware-scroll-view'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<KeyboardAwareScrollView
  {% if element.values.contentContainerStyle %}contentContainerStyle={ {{element.values.contentContainerStyle}} }{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
  {% if element.values.enableOnAndroid %}enableOnAndroid{% endif %}
  {% if element.values.extraScrollHeight %}extraScrollHeight={ {{element.values.extraScrollHeight}} }{% endif %}
>
{{ content | raw }}
</KeyboardAwareScrollView>