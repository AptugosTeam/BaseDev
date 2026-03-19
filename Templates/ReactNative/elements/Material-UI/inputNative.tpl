/*
path: inputNative.tpl
type: file
unique_id: EEC13AGo
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: label
    display: Label
    type: text
    options: ''
  - name: value
    display: Value
    type: text
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: onPress
    display: On Press
    type: text
    options: ''
  - name: onChangeText
    display: On Change
    type: code
    options: ''
  - name: secureTextEntry
    display: Secure Text Entry
    type: text
    options: ''
  - name: iconName
    display: Icon Name
    type: text
    options: ''
  - name: sizeIcon
    display: Size Icon
    type: text
    options: ''
  - name: iconColor
    display: Icon Color
    type: text
    options: ''
  - name: inputStyle
    display: Input Style
    type: text
    options: ''
  - name: containerStyle
    display: Container Style
    type: text
    options: ''
  - name: underlineColor
    display: Underline Color
    type: text
  - name: activeUnderlineColor
    display: Underline Color (Active)
    type: text
children: []
*/
{% set bpr %}
import { View, TextInput, TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
{% endset %}
{{ save_delayed('bpr', bpr) }}

<View
 {% if element.values.containerStyle %} style={ {{ element.values.containerStyle }} } {% endif %}
>
  <TextInput
 {% if element.values.inputStyle %} style={ {{ element.values.inputStyle }} }{% endif %}
 {% if element.values.onChangeText %} onChangeText = {(e) => {{ element.values.onChangeText }} } {% endif %}
 {% if element.values.value %} value={{ element.values.value }} {% endif %}
 {% if element.values.placeholder %} placeholder= "{{ element.values.placeholder }}" {% endif %}
 {% if element.values.secureTextEntry %} secureTextEntry={{ element.values.secureTextEntry }} {% endif %}
 {% if element.values.underlineColor %}underlineColor={ {{ element.values.underlineColor | textOrVariable }}}{% endif %}
 {% if element.values.activeUnderlineColor %}activeUnderlineColor={{ element.values.activeUnderlineColor | textOrVariable }}{% endif %}
  />
  <TouchableOpacity 
  {% if element.values.onPress %} onPress={{ element.values.onPress }} {% endif %}
  >
    <Icon
      {% if element.values.iconName %} name={{ element.values.iconName }} {% endif %}
      {% if element.values.sizeIcon %} size={ {{ element.values.sizeIcon }} } {% endif %}
      {% if element.values.iconColor %} color="{{ element.values.iconColor }}" {% endif %}
    />
  </TouchableOpacity>
</View>
