/*
path: while.tpl
type: file
unique_id: whilewhile
icon: ico-while
sourceType: javascript
helpText: Allows you to loop while condition is met
options:
  - name: condition
    display: Condition
    type: variable
    options: ''
children: []
*/
while ({{ element.values.condition }}) {
  {{ content | raw }}
}
