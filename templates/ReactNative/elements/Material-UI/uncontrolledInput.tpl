/*
path: uncontrolledInput.tpl
type: file
unique_id: EECbOrrq
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
    type: text
    options: ''
  - name: placeholder
    display: Placeholder
    type: text
    options: ''
  - name: variant
    display: Variant
    type: dropdown
    options: flat;outlined
  - name: className
    display: ClassName
    type: text
    options: ''
  - name: textColor
    display: Text Color
    type: text
  - name: theme
    display: Theme
    type: text
    options: ''
  - name: fieldname
    display: fieldname
    type: text
    options: ''
  - name: type
    display: Type
    type: dropdown
    options: text;password;date;number;textarea
  - name: leftIcon
    display: Icon (left side)
    type: dropdown
    options: none;email-outline;eye;magnify
  - name: rightIcon
    display: Icon (right side)
    type: dropdown
    options: none;email-outline;eye;magnify
  - name: underlineColor
    display: Underline Color
    type: text
  - name: activeUnderlineColor
    display: Underline Color (Active)
    type: text
  - name: outlineColor
    display: Outline Color
    type: text
  - name: activeOutlineColor
    display: Outline Color (Active)
    type: text
  - name: placeholderTextColor
    display: PlaceHolder Text Color
    type: text
  - name: onFocus
    display: On Focus
    type: function
    options: ''
  - name: labelWithVar
    display: Label With Variables
    type: text
    options: ''
    advanced: true
  - name: error
    display: Error
    type: variable
    options: ''
  - name: useHelperText
    display: Use Helper Text?
    type: checkbox
    options: ''
  - name: visible
    display: Visible
    type: text
    options: ''
    settings: 
      propertyCondition: useHelperText
      condition: true
  - name: helperText
    display: Helper Text
    type: text
    options: ''
    settings: 
      propertyCondition: useHelperText
      condition: true
  - name: messageType
    display: Type of message
    type: dropdown
    options: >-
      return [['info','Info'],['error','Error']]
  - name: helperStyle
    display: Classname for Helper
    type: text
    options: ''
    settings:
      propertyCondition: useHelperText
      condition: true
children: []
*/
{% if element.values.useHelperText %}{% set useHelperText = true %}{% endif %}
{% if element.values.type == 'date' %}
  {{ add_setting('Packages', '"react-native-paper-dates": "^0.18.12",') }}
  {% set bpr %}
    import { DatePickerInput, es, registerTranslation } from 'react-native-paper-dates'
    registerTranslation('es', es)
  {% endset %}
  {{ save_delayed('bpr', bpr) }}
  <DatePickerInput
    locale='es'
    mode="{{ element.values.variant|default('flat') }}"
    {% if element.values.label %}label="{{ element.values.label }}"{% endif %}
    {% if element.values.value %}value={{ element.values.value }}{% endif %}
    {% if element.values.onChange %}onChange={ {{ element.values.onChange | functionOrCall }} }{% endif %}
    {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
    {% if element.values.textColor %}textColor={ {{ element.values.textColor | textOrVariable }}}{% endif %}
    {% if element.values.underlineColor %}underlineColor={ {{ element.values.underlineColor | textOrVariable }}}{% endif %}
    {% if element.values.activeUnderlineColor %}activeUnderlineColor={ {{ element.values.activeUnderlineColor | textOrVariable }}}{% endif %}
    {% if element.values.labelWithVar %}label={ {{element.values.labelWithVar}} }{% endif %}
    inputMode="start"
  />
{% else %}
  {% set bpr %}
  import { TextInput, HelperText } from 'react-native-paper'
  {% endset %}
  {{ save_delayed('bpr', bpr) }}
  <TextInput
      mode="{{ element.values.variant|default('flat') }}"
      {% if element.values.Autofocus %}autoFocus{% endif %}
      {% if element.values.placeholder %}placeholder={{ element.values.placeholder|textOrVariable }}{% endif %}
      {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
      {% if element.values.label %}label="{{ element.values.label }}"{% endif %}
      {% if element.values.className %}style={ {{ element.values.className }} }{% endif %}
      {% if element.values.theme %}theme={ {{ element.values.theme }} }{% endif %}
      {% if element.values.labelWithVar %}label={ {{element.values.labelWithVar}} }{% endif %}
      {% if element.values.onFocus %}onFocus={() => {{element.values.onFocus}} }{% endif %}
      {% if element.values.error %}error={ {{ element.values.error }} }{% endif %}
      {% if element.values.fieldname %}name={{ element.values.fieldname | textOrVariable}} {% endif %}
      {% if element.values.type == 'number' %}keyboardType='numeric'{% endif %}
      {% if element.values.type == 'password' %}secureTextEntry={true}{% endif %}
      {% if element.values.type == 'textarea' %}
        multiline
      {% endif %}
      outlineColor={ {{ element.values.outlineColor|default('transparent') | textOrVariable }}}
      activeOutlineColor={ {{ element.values.activeOutlineColor|default('#3A528A') | textOrVariable }}}
      {% if element.values.textColor %}textColor={ {{ element.values.textColor | textOrVariable }}}{% endif %}
      {% if element.values.value %}value={{ element.values.value }}{% endif %}
      {% if element.values.onChange %}onChangeText={ {{ element.values.onChange | replace({ '.target.value': '' }) | functionOrCall }} }{% endif %}
      {% if element.values.underlineColor %}underlineColor={ {{ element.values.underlineColor | textOrVariable }}}{% endif %}
      {% if element.values.activeUnderlineColor %}activeUnderlineColor={ {{ element.values.activeUnderlineColor | textOrVariable }}}{% endif %}
      {% if element.values.placeholderTextColor %}placeholderTextColor={ {{ element.values.placeholderTextColor | textOrVariable }}}{% endif %}
      {% if element.values.leftIcon and element.values.leftIcon != 'none' %}left={<TextInput.Icon {% if element.values.placeholderTextColor %}iconColor={ {{ element.values.placeholderTextColor | textOrVariable }}}{% endif%} icon='{{element.values.leftIcon}}' />}{% endif %}
      {% if element.values.rightIcon and element.values.rightIcon != 'none' %}right={<TextInput.Icon {% if element.values.placeholderTextColor %}iconColor={ {{ element.values.placeholderTextColor | textOrVariable }}}{% endif%} icon='{{element.values.rightIcon}}' />}{% endif %}
  />
    {% if useHelperText %}
        <HelperText
          {% if element.values.messageType %}
            type="{{element.values.messageType}}"
          {% endif %}
          {% if element.values.visible %}
            visible={ {{element.values.visible}} }
          {% endif %}
          {% if element.values.helperStyle %}style={ {{element.values.helperStyle}} } {% endif %}
        >
          {% if element.values.helperText %}
            {{ element.values.helperText | default("Help!!!!") }}
          {% endif %}
        </HelperText>
      {% endif %}
{% endif %}