/*
path: DatePickerModal.tpl
type: file
unique_id: DPMbOrr4
icon: ico-uncontrolled-input
sourceType: javascript
options:
  - name: locale
    display: Locale
    type: dropdown
    options: >-
      return [['ar', 'Arabic'],['ca', 'Catalan'],['de', 'German'],['en', 'English'],['en-GB', 'English (UK)'],['es', 'Spanish'],['fr', 'French'],['he', 'Hebrew'],['hi', 'Hindi'],['it', 'Italian'],['ko', 'Korean'],['nl', 'Dutch'],['pl', 'Polish'],['pt', 'Portuguese'],['tr', 'Turkish'],['zh', 'Chinese'],['zh-TW', 'Chinese (Taiwan)'],['cs', 'Czech'],['el', 'Greek'],['ru', 'Russian'],['ro', 'Romanian'],['id', 'Indonesian']]
  - name: mode
    display: Mode
    type: dropdown
    options: >-
      return [['single','Single'],['multiple','Multiple'],['range','Range']]
  - name: visible
    display: Visible
    type: text
    options: ''
  - name: onDismiss
    display: On Dismiss 
    type: function
    options: ''
  - name: date
    display: Date
    type: text
    options: ''
  - name: onConfirm
    display: On Confirm
    type: function
    options: ''
  - name: validRange
    display: Valid Range
    type: text
    options: ''
  - name: onChange
    display: On Change
    type: text
    options: ''
  - name: saveLabel
    display: Save Label
    type: text
    options: ''
  - name: saveLabelDisabled
    display: Save Label Disabled
    type: text
    options: ''
  - name: uppercase
    display: Uppercase
    type: text
    options: ''
  - name: label
    display: Label
    type: text
    options: ''
  - name: animationType
    display: Animation Type
    type: text
    options: ''
  - name: startYear
    display: Start Year
    type: text
    options: ''
  - name: endYear
    display: End Year
    type: text
    options: ''
  - name: closeIcon
    display: Close Icon
    type: text
  - name: editIcon
    display: Edit Icon
    type: text
    options: ''
  - name: calendarIcon
    display: Calendar Icon (MaterialCommunityIcons)
    type: text
    options: ''
  - name: inputEnabled
    display: input Enabled
    type: text
    options: ''
  - name: disableStatusBarPadding
    display: disable Status Bar Padding
    type: text
    options: ''
  - name: presentationStyle
    display: presentation Style 
    type: dropdown
    options: >-
      return [['fullScreen','Full Screen'],['pageSheet','Page Sheet'],['formSheet','Form Sheet'],['overFullScreen','Over Full Screen']]
settings:
  - name: Packages
    value: '"react-native-paper-dates": "^0.18.12",'
*/
  {% set bpr %}
  import { DatePickerModal, {{element.values.locale | default(en)}}, registerTranslation } from 'react-native-paper-dates'
  {% endset %}
  {{ save_delayed('bpr', bpr) }}
  {% set ph %}
    React.useEffect(() => {
      registerTranslation('{{element.values.locale}}', {{ element.values.locale|replace({'-': ''}) }})
    }, [])
  {% endset %}
  {{ save_delayed('ph', ph ) }}
  <DatePickerModal
      {% if element.values.locale %}locale="{{ element.values.locale }}"{% endif %}
      {% if element.values.mode %}mode="{{ element.values.mode }}"{% endif %}
      {% if element.values.visible %}visible={ {{ element.values.visible }} }{% endif %}
      {% if element.values.onDismiss %}onDismiss={() => { {{ element.values.onDismiss }} } }{% endif %}
      {% if element.values.date %}date={ {{ element.values.date }} }{% endif %}
      {% if element.values.onConfirm %}onConfirm={(params) => { {{ element.values.onConfirm }} } }{% endif %}
      {% if element.values.validRange %}validRange={ {{ element.values.validRange }} }{% endif %}
      {% if element.values.onChange %}onChange={ {{ element.values.onChange }}}{% endif %}
      {% if element.values.saveLabel %}saveLabel={{ element.values.saveLabel | textOrVariable }}{% endif %}
      {% if element.values.saveLabelDisabled %}saveLabelDisabled={ {{ element.values.saveLabelDisabled }} }{% endif %}
      {% if element.values.uppercase %}uppercase={ {{ element.values.uppercase }} }{% endif %}
      {% if element.values.label %}label={ {{ element.values.label | textOrVariable }} }{% endif %}
      {% if element.values.animationType %}animationType={ {{ element.values.animationType }} }{% endif %}
      {% if element.values.startYear %}startYear={ {{ element.values.startYear }} }{% endif %}
      {% if element.values.endYear %}endYear={ {{ element.values.endYear }} }{% endif %}
      {% if element.values.closeIcon %}closeIcon={ {{ element.values.closeIcon }} }{% endif %}
      {% if element.values.editIcon %}editIcon={ {{ element.values.editIcon }} }{% endif %}
      {% if element.values.calendarIcon %}calendarIcon={ {{ element.values.calendarIcon | textOrVariable }} }{% endif %}
      {% if element.values.inputEnabled %}inputEnabled={ {{ element.values.inputEnabled }} }{% endif %}
      {% if element.values.disableStatusBarPadding %}disableStatusBarPadding={{ element.values.disableStatusBarPadding }}{% endif %}
      {% if element.values.presentationStyle %}presentationStyle={{ element.values.presentationStyle }}{% endif %}
      
  />