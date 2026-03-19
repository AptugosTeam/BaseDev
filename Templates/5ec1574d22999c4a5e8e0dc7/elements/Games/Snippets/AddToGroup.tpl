/*
path: AddToGroup.tpl
keyPath: elements/Games/Snippets/AddToGroup.tpl
unique_id: 8Hzk6UJt
icon: f:diversity_3.svg
options:
  - name: groupName
    display: Group Name
    type: text
    options: ''
  - name: object
    display: Object
    type: text
    options: ''
*/
this.{{ element.values.groupName }}.add(this.{{ element.values.object }})