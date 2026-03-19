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
  - name: enableTooltip
    display: Enable Tooltip
    type: checkbox
    settings:
      default: false
    advanced: true
  - name: arrow
    display: Use Arrow Tooltip
    type: checkbox
    settings:
      default: false
      condition: ''  
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
  - name: ariaLabel
    display: Add ARIA Label
    type: checkbox
    settings:
      default: false
    advanced: true
  - name: ariaLabelValue
    display: Value of ARIA Label
    type: text
    advanced: true
    settings:
      condition: true
      propertyCondition: ariaLabel
  - name: key
    display: Key
    type: text
    advanced: true
  - name: onMouseDown
    display: On Mouse Down
    type: text
    advanced: true
  - name: onMouseOver
    display: On Mouse Over
    type: text
    advanced: true
  - name: onMouseOut
    display: On Mouse Out
    type: text
    advanced: true
  - name: onScroll
    display: On Scroll
    type: text
    advanced: true
  - name: onTouchStart
    display: On Touch Start
    type: text
    options: ''
    advanced: true
  - name: onTouchMove
    display: On Touch Move
    type: text
    options: ''
    advanced: true
  - name: onTouchEnd
    display: On Touch End
    type: text
    options: ''
    advanced: true
  - name: onTransitionEnd
    display: On Transition End
    type: text
    options: ''
    advanced: true
children: []
helpText: Basic HTML Div element
*/
{% set tag = element.values.tag|default('div') %}
<{{tag}}
  {% if type == 'DevelopmentDebug' %}data-aptugo="{{ element.unique_id }}"{% endif %}
  {% if element.values.enableTooltip %}
    {% if element.values.title %}
      title={{ element.values.title | textOrVariable }}
      data-title={{ element.values.title | textOrVariable }}
    {% else %}
      title="{{ element.name }}"
      data-title="{{ element.name }}"
    {% endif %}
  {% else %}
    {% if element.values.title %}
      data-title={{ element.values.title | textOrVariable }}
    {% else %}
      data-title="{{ element.name }}"
    {% endif %}
  {% endif %}
  {% if element.values.dataAttribute and element.values.nameAttribute and element.values.valueAttribute %}
    data-{{ element.values.nameAttribute }}={ {{ element.values.valueAttribute }} }
  {% endif %}
  {% if element.values.ariaLabel and element.values.ariaLabelValue %}
    aria-label={ {{ element.values.ariaLabelValue }} }
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
  {% if element.values.key %}
    key={ {{element.values.key}} }
  {% endif %}
  {% if element.values.onMouseDown %}
    onMouseDown={ {{element.values.onMouseDown}} }
  {% endif %}
  {% if element.values.onMouseOver %}
    onMouseOver={(e) => {{element.values.onMouseOver}} }
  {% endif %}
  {% if element.values.onMouseOut %}
  {% if element.values.onMouseOut starts with '() =>' or element.values.onMouseOut starts with '(e) =>' %}
    onMouseOut={ {{element.values.onMouseOut}} }
  {% else %}
    onMouseOut={(e) => {{element.values.onMouseOut}} }
  {% endif %}
  {% endif %}
  {% if element.values.onScroll %}
    onScroll={(e) => {{element.values.onScroll}} }
  {% endif %}
  {% if element.values.onTouchStart %}
    onTouchStart={(e) => {{element.values.onTouchStart}} }
  {% endif %}
  {% if element.values.onTouchMove %}
    onTouchMove={(e) => {{element.values.onTouchMove}} }
  {% endif %}
  {% if element.values.onTouchEnd %}
    onTouchEnd={(e) => {{element.values.onTouchEnd}} }
  {% endif %}
  {% if element.values.onTransitionEnd %}
    onTransitionEnd={(e) => {{element.values.onTransitionEnd}} }
  {% endif %}
>
{{ content | raw }}
</{{tag}}>
