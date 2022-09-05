/*
path: div.tpl
completePath: elements/Basic/div.tpl
type: file
unique_id: y8fra7Zo
icon: ico-div
sourceType: javascript
options:
  - name: class
    display: ClassName
    type: styles
    options: ''
  - name: useid
    display: Use UniqueID as ID
    type: checkbox
    options: ''
  - name: id
    display: ID
    type: text
    options: ''
  - name: onclick
    display: On Click
    type: function
    options: ''
  - name: ref
    display: Use Reference
    type: text
    options: ''
  - name: style
    display: Extra Styles
    type: text
    options: ''
children: []
helpText: Basic HTML Div element
*/
<div
  title="{{ element.name }}"
  {% if element.values.useid %}id="{{ element.unique_id }}"{% endif %}
  {% if element.values.id %}id={{ element.values.id | textOrVariable }}{% endif %}
  {% if element.values.class %}className={ {{element.values.class}} }{% endif %}
  {% if element.values.onclick %}onClickCapture={(e) => {{element.values.onclick}} }{% endif %}
  {% if element.values.ref %}ref={ {{element.values.ref}} }{% endif %}
  {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
>
{{ content | raw }}
</div>
