/*
path: GoogleIcon.tpl
type: file
unique_id: RhMaXHE4
icon: f:GoogleIcon.svg
helpText: Help import icons from Google Fonts
children: []
options:
  - name: icon
    display: Icon name
    type: text
    options: ''
    settings:
      default: 'Home'
    required: true
  - name: style
    display: Style
    type: dropdown
    options: 
      return [['outlined', 'Outlined'],['rounded', 'Rounded'],['sharp', 'Sharp']]
    settings:
      default: 'outlined'
  - name: filled
    display: Fill
    type: dropdown
    options: 
      return [['1', 'Filled'],['0', 'Unfilled']]
    settings:
      default: '0'
  - name: grade
    display: Grade
    type: dropdown
    options: 
      return [['-25', 'Low emphasis'],['0', 'Default'],['200', 'High emphasis']]
    settings:
      default: '0'
  - name: opticalSize
    display: Optical size
    type: dropdown
    options: 
      return [['20', '20'],['24', '24'],['40', '40'],['48', '48']]
    settings:
      default: '24'
  - name: className
    display: className
    type: styles
  - name: fontSize
    display: Size
    type: text
    options: ''
    settings:
      default: '24'
  - name: color
    display: Color
    type: text
    options: ''
    settings:
      default: '#000000'
  - name: backgroundColor
    display: Background color
    type: text
    options: ''
    settings:
      default: 'transparent'
*/
{% set GF %}
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>
{% endset %}
{{ add_setting('IndexBodyAdd', GF) }}
<span className={`material-symbols-{{element.values.style|default('outlined')}}{% if element.values.className %} ${ {{ element.values.className }} }{% endif %}`}style={ {userSelect: 'none', fontVariationSettings: "'FILL' {{element.values.filled|default('0')}}, 'GRAD' {{element.values.grade|default('0')}}, 'opsz' {{element.values.opticalSize|default('24')}}"{% if element.values.fontSize %}, fontSize: {{element.values.fontSize}}{% endif %}{% if element.values.backgroundColor %}, backgroundColor: "{{element.values.backgroundColor}}"{% endif %}{% if element.values.color %}, color: "{{element.values.color}}"{% endif %} } }>{{element.values.icon|default('Home')}}</span>