/*
path: Switch.tpl
type: file
unique_id: rCl7agO5
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
  - name: trackColor
    display: Track Color (off)
    type: text
  - name: trackColorOn
    display: Track Color (on)
    type: text
  - name: thumbColor
    display: Thumb Color (off)
    type: text
  - name: thumbColorOn
    display: Thumb Color (on)
    type: text
  - name: class
    display: ClassName
    type: text
    options: ''
sourceType: javascript
children: []
*/
{% set bpr %}
  import {Switch} from 'react-native'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Switch
  trackColor={ { false: '{{ element.values.trackColor|default("#767577") }}', true: '{{ element.values.trackColor|default("#dfdfdf") }}'}}
  thumbColor={ {{ element.values.Checked }} ? '{{ element.values.thumbColorOn|default("#f5dd4b") }}' : '{{ element.values.trackColor|default("#f4f3f4") }}'}
  {% if element.values.OnClick %}
    onChange={ (e)=> { {{ element.values.OnClick }} } }
  {% endif %}
  value={ {{ element.values.Checked }} }
  {% if element.values.class %}style={ {{element.values.class}} }{% endif %}
/>