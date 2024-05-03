/*
path: FloatingLabelInput.tpl
type: file
unique_id: FLIbOrra
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
  - name: onChange
    display: On Change
    type: function
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: staticLabel
    display: Static Label?
    type: checkbox
    options: ''
  - name: customLabelStyles
    display: Custom Label Styles?
    type: checkbox
    options: ''
  - name: startSeparatorCustomLabelStyles
    display: Start Custom Label Styles
    type: separator
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: leftFocused
    display: Left Focused
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: leftBlurred
    display: Left Blurred
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: topFocused
    display: Top Focused
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: topBlurred
    display: Top Blurred
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: fontSizeFocused
    display: Font Size Focused
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: fontSizeBlurred
    display: Font Size Blurred
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: colorFocused
    display: Color Focused
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: colorBlurred
    display: Color Blurred
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: endSeparatorCustomLabelStyles
    display: End Custom Label Styles
    type: separator
    settings:
      condition: true
      propertyCondition: customLabelStyles
  - name: labelStyles
    display: Label Styles
    type: text
    options: ''
  - name: containerStyles
    display: Container Styles
    type: text
    options: ''
  - name: inputStyles
    display: Input Styles
    type: text
    options: ''
  - name: textColor
    display: Text Color
    type: text
  - name: onFocus
    display: On Focus
    type: function
    options: ''
  - name: onBlur
    display: On Blur
    type: function
    options: ''
  - name: keyboardType
    display: Keyboard Type
    type: text
    options: ''
  - name: editable
    display: Disable
    type: text
    options: ''
settings:
  - name: Packages
    value: '"react-native-floating-label-input": "1.4.2",'
*/
  {% set bpr %}
  import { FloatingLabelInput } from 'react-native-floating-label-input'
  {% endset %}
  {{ save_delayed('bpr', bpr) }}
  <FloatingLabelInput
      {% if element.values.placeholder %}hint={{ element.values.placeholder|textOrVariable }}{% endif %}
      {% if element.values.staticLabel %}staticLabel{% endif %}
      {% if element.values.editable %}editable={ {{ element.values.editable }} }{% endif %}
      {% if element.values.label %}label={{ element.values.label | textOrVariable }}{% endif %}
      {% if element.values.keyboardType %}keyboardType={{ element.values.keyboardType | textOrVariable }}{% endif %}
      {% if element.values.labelStyles %}labelStyles={ {{ element.values.labelStyles }} }{% endif %}
      {% if element.values.customLabelStyles %}
        customLabelStyles={ { 
        {% if element.values.leftFocused %}leftFocused:{{ element.values.leftFocused }},{% endif %}
        {% if element.values.leftBlurred %}leftBlurred:{{ element.values.leftBlurred }},{% endif %}
        {% if element.values.topFocused %}topFocused:{{ element.values.topFocused }},{% endif %}
        {% if element.values.topBlurred %}topBlurred:{{ element.values.topBlurred }},{% endif %}
        {% if element.values.fontSizeFocused %}fontSizeFocused:{{ element.values.fontSizeFocused }},{% endif %}
        {% if element.values.fontSizeBlurred %}fontSizeBlurred:{{ element.values.fontSizeBlurred }},{% endif %}
        {% if element.values.colorFocused %}colorFocused:{{ element.values.colorFocused }},{% endif %}
        {% if element.values.colorBlurred %}colorBlurred:{{ element.values.colorBlurred }},{% endif %}
        } }
      {% endif %}
      {% if element.values.containerStyles %}containerStyles={ {{ element.values.containerStyles }} }{% endif %}
      {% if element.values.inputStyles %}inputStyles={ {{ element.values.inputStyles }} }{% endif %}
      {% if element.values.onFocus %}onFocus={() => {{element.values.onFocus}} }{% endif %}
      {% if element.values.onBlur %}onBlur={() => {{element.values.onBlur}} }{% endif %}
      {% if element.values.textColor %}textColor={ {{ element.values.textColor | textOrVariable }}}{% endif %}
      {% if element.values.value %}value={{ element.values.value | textOrVariable }}{% endif %}
      {% if element.values.onChange %}onChangeText={ {{ element.values.onChange | replace({ '.target.value': '' }) | functionOrCall }} }{% endif %}
  />