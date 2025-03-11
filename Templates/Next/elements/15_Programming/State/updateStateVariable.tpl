/*
path: updateStateVariable.tpl
type: file
unique_id: updateStateVariable
icon: ico-update-state
sourceType: javascript
helpText: Updates the value of a state variable
options:
  - name: variable
    display: Variable to Update
    type: variable
    options: ''
  - name: newvalue
    display: New Value
    type: variable
    options: ''  
children: []
*/
{% if content %}
  set{{ element.values.variable }}((oldvalues) => {
    {{ content | raw }}
  })
{% else %}
  set{{ element.values.variable }}({{ element.values.newvalue}})
{% endif %}

