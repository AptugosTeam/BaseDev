/*
path: div.tpl
completePath: elements/Basic/div.tpl
type: file
unique_id: y8fra7Zo
icon: ico-div
double: true
color: rgb(0,230,230)
backColor: rgba(6, 201, 210, 0.25)
sourceType: javascript
order: 1
options:
  - name: className
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
    type: style
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
  - name: dataAttribute
    display: Add Data Attribute
    type: checkbox
    settings:
      default: false
    advanced: true
  - name: nameAttribute
    display: Name of Data Attribute
    type: text
    advanced: true
    settings:
      condition: true
      propertyCondition: dataAttribute
  - name: valueAttribute
    display: Value of Data Attribute
    type: text
    advanced: true
    settings:
      condition: true
      propertyCondition: dataAttribute
  - name: onMouseEnter
    display: On Mouse Enter
    type: text
    advanced: true
  - name: onMouseLeave
    display: On Mouse Leave
    type: text
    advanced: true
children: []
helpText: Basic HTML Div element
*/
{% set tag = element.values.tag|default('div') %}
<{{tag}}
  {% if type == 'DevelopmentDebug' %}data-aptugo="{{ element.unique_id }}"{% endif %}
  {% if element.values.title %}
    title={{ element.values.title | textOrVariable }}
    data-title={{ element.values.title | textOrVariable }}
  {% else %}
    title="{{ element.name }}"
    data-title="{{ element.name }}"
  {% endif %}
  {% if element.values.dataAttribute and element.values.nameAttribute and element.values.valueAttribute %}
    data-{{ element.values.nameAttribute }}={ {{ element.values.valueAttribute }} }
  {% endif %}
  {% if element.values.useid %}
    id="{{ element.unique_id }}"
  {% elseif element.values.id %}
    id={{ element.values.id | textOrVariable }}
  {% endif %}
  {% if element.values.className %}
    className={ {{element.values.className|raw}} }
  {% endif %}
  {% if element.values.style %}
  /* {{ element.values.style | raw }} */
    render={2} style={ {{element.values.style }} }
  {% endif %}
  {% if element.values.ref %}
    ref={ {{element.values.ref}} }
    {% include includeTemplate('useRef.tpl') with {
      element: { values: { variableName: element.values.ref, defaultValue: 'null' } }
    } %}
  {% endif %}
  {% if element.values.onclick %}
    onClick={ {{ element.values.onclick | functionOrCall }} }
  {% endif %}
  {% if element.values.onMouseEnter %}
    onMouseEnter={ {{ element.values.onMouseEnter | functionOrCall }} }
  {% endif %}
  {% if element.values.onMouseLeave %}
    onMouseLeave={ {{ element.values.onMouseLeave | functionOrCall }} }
  {% endif %}
>
{{ content | raw }}
</{{tag}}>
