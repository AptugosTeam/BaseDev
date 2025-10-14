/*
path: checkbox.tpl
type: file
unique_id: rCl7agO3
icon: ico-check-box
options:
  - name: Checked
    display: Checked Variable
    type: text
    options: ''
  - name: OnClick
    display: OnClick
    type: text
    options: ''
  - name: label
    display: label
    type: text
  - name: margin
    display: margin
    type: dropdown
    options: dense;normal;none
  - name: threeway
    display: Use a 3 states checkbox
    type: checkbox
  - name: Switch
    display: Use a Switch instead of a checkbox
    type: checkbox
  - name: ClassName
    display: ClassName
    type: text
    options: ''
  - name: activeOpacity
    display: Opacity
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set bpr %}
import { MaterialIcons } from '@expo/vector-icons'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import { View } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set bpr %}
import { TouchableOpacity } from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% if element.values.OnClick %}
<TouchableOpacity 
  onPress={() => {{ element.values.OnClick }} } 
  {% if element.values.ClassName %}style={ {{ element.values.ClassName }} }{% endif %}
  {% if element.values.activeOpacity %}activeOpacity={ {{ element.values.activeOpacity}} }{% endif %}
>
{% endif %}
  <View 
  {% if element.values.ClassName and not element.values.OnClick %}
    style={ {{ element.values.ClassName }} }
  {% else %}
    style={ { flexDirection: 'row', alignItems: 'center' } }
  {% endif %}
  >
    <MaterialIcons size={20} name={ {{ element.values.Checked }} ? 'check-box' : 'check-box-outline-blank'} {% if element.values.ClassName %}style={ {{ element.values.ClassName ~ 'icon' }} }{% endif %} />
    {% if element.values.label %}
    <Text {% if element.values.ClassName %}style={ {{ element.values.ClassName ~ 'text' }} }{% endif %}>{{ element.values.label }}</Text>
    {% endif %}
  </View>
{% if element.values.OnClick %}
</TouchableOpacity>
{% endif %}
