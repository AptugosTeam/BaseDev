/*
path: fileUploadButton.tpl
keyPath: elements/Interact/fileUploadButton.tpl
unique_id: FAMGDClO
options:
  - name: buttonText
    display: Button Text
    type: text
    options: ''
    settings:
      default: Button
  - name: Classname
    display: ClassName
    type: styles
    options: ''
  - name: onChange
    display: On Change 
    type: function
    required: true
  - name: accept
    display: File extensions accepted
    type: text
    options: ''
  - name: Variant
    display: Variant
    type: dropdown
    options: text;contained;outlined
  - name: Color
    display: Color
    type: dropdown
    options: default;inherit;primary;secondary;error;info;success;warning
    settings:
      default: primary
  - name: disabled
    display: Disabled
    type: variable
    options: ''
    settings:
      active: true
  - name: fullWidth
    display: Full Width
    type: checkbox
    options: ''
  - name: icon
    display: Icon
    type: dropdown
    options: >-
      None;Add;Home;Link;Send;AllInbox;Menu;DeleteOutline;Favorite;Upload;Google;Facebook;Twitter;Person;ThumbUp
  - name: extraCode
    display: Extra Code
    type: function
    options: ''
    advanced: true
sourceType: javascript
children: []
*/
{% if element.values.icon and element.values.icon != 'None' %}
{% set bpr %}
import {{ element.values.icon }}Icon from '@mui/icons-material/{{ element.values.icon }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% endif %}
{% set bpr %}
import Button from '@mui/material/Button'
import { styled } from '@mui/material/styles';
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const VisuallyHiddenInput = styled('input')({
  clip: 'rect(0 0 0 0)',
  clipPath: 'inset(50%)',
  height: 1,
  overflow: 'hidden',
  position: 'absolute',
  bottom: 0,
  left: 0,
  whiteSpace: 'nowrap',
  width: 1,
});
{% endset %}
{{ save_delayed('ph',ph)}}

<Button
  component="label"
  {% if element.values.Variant %}variant='{{ element.values.Variant }}'{% endif %}
  {% if element.values.Color %}color='{% if element.values.Color == 'default' %}inherit{% else %}{{ element.values.Color }}{% endif %}'{% endif %}
  {% if element.values.Action %}onClickCapture={ {{ element.values.Action | functionOrCall }} }{% endif %}
  {% if element.values.Classname %}className={ {{ element.values.Classname }} }{% endif %}
  {% if element.values.fullWidth %}fullWidth{% endif %}
  {% if element.values.icon and element.values.icon != 'None' %}startIcon={<{{ element.values.icon }}Icon />}{% endif %}
  {% if element.values.disabled %}disabled={ {{element.values.disabled}} }{% endif %}
  {% if element.values.extraCode %} {{element.values.extraCode}} {% endif %}
  onChange={ {{element.values.onChange | functionOrCall }} }
>
  {{ element.values.buttonText }}{{ content | raw }}
  <VisuallyHiddenInput type="file" {% if element.values.accept %}accept=" {{element.values.accept}} "{% endif %}
/>
</Button>