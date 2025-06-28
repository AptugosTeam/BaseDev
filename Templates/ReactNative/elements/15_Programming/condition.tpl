/*
path: condition.tpl
type: file
unique_id: zT1b8lbX
icon: ico-condition
color: rgb(255, 192, 128)
order: 1
sourceType: javascript
options:
  - name: condition
    display: Condition
    type: text
    options: ''
    settings:
      condition: false
      propertyCondition: else
  - name: usefragment
    display: Do Not Use Fragment
    type: checkbox
    options: ''
  - name: useInCode
    display: This condition is part of code
    type: checkbox
  - name: elseif
    display: This is an else-if
    type: checkbox
    advanced: true
    options: ''
    settings:
      condition: true
      propertyCondition: useInCode
  - name: else
    display: This is an else block
    type: checkbox
    advanced: true
    options: ''
    settings:
      condition: true
      propertyCondition: useInCode
helpText: Make a decision based on a value
children: []
*/
{% if element.values.useInCode %}
  {% set property = 'if' %}
  {% if element.values.else %}{% set property = 'else' %}{% endif %}
  {% if element.values.elseif %}else {% endif %}{{ property }} {% if element.values.condition %}({{ element.values.condition }}){% endif %} {
    {{ content | raw }}
  }
{% else %}
  { {{ element.values.condition }} &&
  {% if not element.values.usefragment %}<React.Fragment>{% endif %}
  {{ content | raw }}
  {% if not element.values.usefragment %}</React.Fragment>{% endif %}
  }
{% endif %}