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
  - name: elseOption
    display: Use else
    type: code
    options: ''
    advanced: true
helpText: Make a decision based on a value
children: []
*/
{% if element.values.useInCode %}
  if ({{ element.values.condition }}) {
    {{ content | raw }}
  }
  {% if element.values.elseOption %}
  else {
    {{ element.values.elseOption }}
  }
  {% endif %}
{% else %}
  { {{ element.values.condition }} &&
  {% if not element.values.usefragment %}<React.Fragment>{% endif %}
  {{ content | raw }}
  {% if not element.values.usefragment %}</React.Fragment>{% endif %}
  }
{% endif %}