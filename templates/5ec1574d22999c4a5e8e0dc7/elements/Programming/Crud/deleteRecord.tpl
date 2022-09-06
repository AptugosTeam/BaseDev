/*
path: deleteRecord.tpl
completePath: elements/Programming/Crud/deleteRecord.tpl
display: Delete a Record
type: file
unique_id: OOQu8gg7
icon: f:deleteRecord.svg
sourceType: javascript
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: record
    display: Record or Record ID
    type: text
children: []
*/
{% set table = element.values.table | tableData %}
{% set tableSingleName = table.singleName | friendly | capitalize %}
{% set bpr %}
// Remove Favorito
  import { remove{{ tableSingleName }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr',bpr)}}
dispatch(remove{{ tableSingleName }} ({{ element.values.record }}))