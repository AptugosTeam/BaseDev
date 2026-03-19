/*
path: condition.tpl
type: file
unique_id: zT1b8lbX
icon: ico-condition
sourceType: javascript
options:
  - name: condition
    display: Condition
    type: text
    options: ''
  - name: usefragment
    display: Do Not Use Fragment
    type: checkbox
    options: ''
  - name: useInCode
    display: This condition is part of code
    type: checkbox
  - name: isElseIf
    display: Is this an else if?
    type: checkbox
    options: ''
  - name: isElse
    display: Is this an else?
    type: checkbox
    options: ''
  - name: elseOption
    display: Use else
    type: code
    options: ''
    advanced: true
helpText: Make a decision based on a value
children: []
*/
{% if element.values.useInCode %}
  {% if element.values.isElseIf %}
  } else if ({{ element.values.condition }}) {
    {{ content | raw }}
  {% elseif element.values.isElse %}
  } else {
    {{ content | raw }}
  {% else %}
  if ({{ element.values.condition }}) {
    {{ content | raw }}
  {% endif %}
  {% set hasElseIf = false %}
  {% set isLastCondition = true %}
  {% for child in element.children %}
    {% if child.values and (child.values.isElseIf or child.values.isElse) %}
      {% set hasElseIf = true %}
      {% set isLastCondition = false %}
    {% endif %}
  {% endfor %}
  {% if not hasElseIf or isLastCondition %}
  }
  {% endif %}
{% else %}
  { {{ element.values.condition }} &&
  {% if not element.values.usefragment %}<React.Fragment>{% endif %}
  {{ content | raw }}
  {% if not element.values.usefragment %}</React.Fragment>{% endif %}
  }
{% endif %}