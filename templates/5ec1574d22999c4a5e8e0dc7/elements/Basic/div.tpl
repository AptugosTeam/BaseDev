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
  - name: style
    display: Extra Styles
    type: text
    options: ''
  - name: ref
    display: Use Reference
    type: text
    options: ''
    advanced: true
  - name: onclick
    display: On Click
    type: function
    options: ''
    advanced: true
  - name: tag
    display: Use a different HTML element
    type: text
    options: ''
    settings:
      default: 'div'
      active: true
    advanced: true
  - name: title
    display: Title Property
    type: text
    advanced: true
children: []
helpText: Basic HTML Div element
*/
{% set tag = element.values.tag|default('div') %}
<{{tag}}
  {% if element.values.title %}
    title={{ element.values.title | textOrVariable }}
    data-title={{ element.values.title | textOrVariable }}
  {% else %}
    title="{{ element.name }}"
    data-title="{{ element.name }}"
  {% endif %}
  {% if element.values.useid %}
    id="{{ element.unique_id }}"
  {% elseif element.values.id %}
    id={{ element.values.id | textOrVariable }}
  {% endif %}
  {% if element.values.class %}
    className={ {{element.values.class|raw}} }
  {% endif %}
  {% if element.values.style %}
    style={ {{element.values.style}} }
  {% endif %}
  {% if element.values.ref %}
    ref={ {{element.values.ref}} }
  {% endif %}
  {% if element.values.onclick %}
    onClick={(e) => {{element.values.onclick}} }
  {% endif %}
>
{{ content | raw }}
</{{tag}}>
