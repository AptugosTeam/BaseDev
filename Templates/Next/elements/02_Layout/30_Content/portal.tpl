/*
path: createPortal.tpl
type: file
unique_id: aptugo-createportal
icon: ico-window
double: true
color: rgb(168,85,247)
backColor: rgba(168, 85, 247, 0.22)
sourceType: javascript
order: 1
options:
  - name: enabled
    display: Enabled
    type: checkbox
    options: ''
    settings:
      default: true
      active: true

  - name: targetMode
    display: Target Mode
    type: dropdown
    options: 'body;selector;expression;ref'
    settings:
      default: 'body'
      active: true

  - name: selector
    display: Target Selector
    type: text
    options: ''
    advanced: true
    settings:
      condition: true
      propertyCondition: targetMode
      valueCondition: 'selector'

  - name: targetExpression
    display: Target Expression
    type: text
    options: ''
    advanced: true
    helpText: Example document.getElementById("modal-root")
    settings:
      condition: true
      propertyCondition: targetMode
      valueCondition: 'expression'

  - name: targetRef
    display: Target Ref Variable
    type: text
    options: ''
    advanced: true
    helpText: Example modalRootRef
    settings:
      condition: true
      propertyCondition: targetMode
      valueCondition: 'ref'

  - name: fallbackInline
    display: Render Inline if Target Missing
    type: checkbox
    options: ''
    settings:
      default: false
      active: true

  - name: wrapperTag
    display: Wrapper Tag
    type: text
    options: ''
    advanced: true
    settings:
      default: 'div'
      active: true

  - name: className
    display: ClassName
    type: styles
    options: ''

  - name: useid
    display: Use UniqueID as ID
    type: checkbox
    options: ''

  - name: id
    display: The ID for the HTML Element
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
    helpText: Use only the onclick handler, Aptugo will auto enclose it in a function using "e" as the event variable

  - name: onMouseEnter
    display: On Mouse Enter
    type: text
    advanced: true

  - name: onMouseLeave
    display: On Mouse Leave
    type: text
    advanced: true

  - name: stopPropagation
    display: Stop Propagation on Click
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
      active: true

  - name: role
    display: ARIA Role
    type: text
    options: ''
    advanced: true

  - name: ariaLabel
    display: ARIA Label
    type: text
    options: ''
    advanced: true

  - name: ariaModal
    display: aria-modal
    type: checkbox
    options: ''
    advanced: true
    settings:
      default: false
      active: true

  - name: title
    display: Title Property
    type: text
    advanced: true

  - name: disabletitle
    display: Do not render title Property
    type: checkbox
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
children: []
helpText: Render children into another DOM target using ReactDOM.createPortal
*/
{% set bpr %}
import { createPortal } from 'react-dom'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set tag = element.values.wrapperTag|default('div') %}
{% set enabledValue = element.values.enabled is defined ? element.values.enabled : true %}

{% set styleValue = null %}
{% if element.values.style is defined and element.values.style %}
  {% if element.values.style is iterable %}
    {% set styleValue = element.values.style|json_encode %}
  {% else %}
    {% set trimmedStyle = element.values.style|trim %}
    {% set isFunction = trimmedStyle matches '/^[a-zA-Z0-9_]+\(.*\)$/' %}
    {% if isFunction %}
      {% set styleValue = trimmedStyle %}
    {% elseif trimmedStyle|slice(0, 1) != '{' %}
      {% set styleValue = '{' ~ trimmedStyle ~ '}' %}
    {% else %}
      {% set styleValue = trimmedStyle %}
    {% endif %}
  {% endif %}
{% endif %}

{% set targetMode = element.values.targetMode|default('body') %}
{% set portalTargetExpr = 'document.body' %}
{% if targetMode == 'selector' and element.values.selector %}
  {% set portalTargetExpr = 'typeof document !== "undefined" ? document.querySelector(' ~ (element.values.selector|textOrVariable) ~ ') : null' %}
{% elseif targetMode == 'expression' and element.values.targetExpression %}
  {% set portalTargetExpr = element.values.targetExpression %}
{% elseif targetMode == 'ref' and element.values.targetRef %}
  {% set portalTargetExpr = element.values.targetRef ~ '?.current || null' %}
{% endif %}

{% set portalWrapper %}
<{{tag}}
  {% if type == 'DevelopmentDebug' %}data-aptugo="{{ element.unique_id }}"{% endif %}
  {% if not element.values.disabletitle %}
    {% if element.values.title %}
      title={{ element.values.title | textOrVariable }}
      data-title={{ element.values.title | textOrVariable }}
    {% else %}
      title="{{ element.name }}"
      data-title="{{ element.name }}"
    {% endif %}
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
    className={ {{ element.values.className|parseStyles }} }
  {% endif %}
  {% if styleValue %}
    style={ {{ styleValue|raw }} }
  {% endif %}
  {% if element.values.role %}
    role={{ element.values.role | textOrVariable }}
  {% endif %}
  {% if element.values.ariaLabel %}
    aria-label={{ element.values.ariaLabel | textOrVariable }}
  {% endif %}
  {% if element.values.ariaModal %}
    aria-modal={true}
  {% endif %}
  {% if element.values.ref %}
    ref={ {{ element.values.ref }} }
    {% include includeTemplate('useRef.tpl') with {
      element: { values: { variableName: element.values.ref, defaultValue: 'null' } }
    } %}
  {% endif %}
  onClick={ (e) => {
    {% if element.values.stopPropagation %}e.stopPropagation();{% endif %}
    {% if element.values.onclick %}{{ element.values.onclick | functionOrCall }}{% endif %}
  } }
  {% if element.values.onMouseEnter %}
    onMouseEnter={ {{ element.values.onMouseEnter | functionOrCall }} }
  {% endif %}
  {% if element.values.onMouseLeave %}
    onMouseLeave={ {{ element.values.onMouseLeave | functionOrCall }} }
  {% endif %}
>
{{ content | raw }}
</{{tag}}>
{% endset %}

{createPortal({{ portalWrapper|raw }}, {{ portalTargetExpr|raw }})}