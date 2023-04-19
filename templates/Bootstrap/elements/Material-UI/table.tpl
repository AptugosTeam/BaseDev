/*
path: table.tpl
type: file
unique_id: IUyfyTiR
icon: ico-table
sourceType: javascript
renderTag: 'table'
calculatedName: >-
  function (ele) { 
    try {
      const tblname = aptugo.store.getState().application.tables.find(tbl => tbl.unique_id === ele.values.table).name
      const calc = tblname + ' Table'
      return calc
    } catch(e) {
      return 'Table'
    }
  }
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [['var','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: variableToUse
    display: Variable to use
    type: text
    options: ''
    settings:
      condition: var
      propertyCondition: table
  - name: headerVariable
    display: Variable to use in Header
    type: text
    options: ''
    settings:
      condition: var
      propertyCondition: table
  - name: editProcedure
    display: Edit Procedure
    type: dropdown
    options: >-
      return [['No','None'],['Internal','Popup Dialog'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) => [unique_id, name])]
  - name: allowEdit
    display: Allow Edition
    type: checkbox
    settings:
      default: true
      condition: ''
  - name: editionTable
    display: Table used in Edits (or deletes)
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: allowDeletion
    display: Allow Deletion
    type: checkbox
    settings:
      default: true
      condition: ''
  - name: detailsURL
    display: Details Page
    type: dropdown
    options: >-
      return [['No','None'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) =>
      [unique_id, name])]
  - name: searchString
    display: Search String
    type: text
    options: ''
  - name: usePagination
    display: Use Pagination
    type: checkbox
    options: ''
    settings:
      default: true
  - name: elementsLimit
    display: Elements Per Page
    type: text
    options: ''
    settings:
      default: '10'
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: confirmDeletes
    display: Show a confirmation before deleting
    type: checkbox
    options: ''
  - name: fixedSearchField
    display: Search this field only
    type: text
  - name: fixedSearchString
    display: Search this string always
    type: text
  - name: defaultPage
    display: Default Page
    type: text
children: []
settings:
  - name: Packages
    value: '"@mdi/js": "7.2.96","@mdi/react": "1.6.1",'
*/
{% set editProc = element.values.editProcedure|default('No') %}
{% set allowEdit = element.values.allowEdit|default(true) %}
{% set allowDeletion = element.values.allowDeletion|default(true) %}
{% set tableFields = [] %}
{% if element.values.table == 'var' %}
  {% set table = element.values.editionTable | tableData %}
  {% set tableName = table.name | friendly %}
  {% set tableSingleName = table.singleName | friendly | capitalize %}
  {% set setEditDataFunctionName = 'set' ~ tableName ~ 'Data' %}
  {% for field in element.children %}
    {% if field.values.Field == 'useVar' %}
      {% set tableFields = tableFields|merge([field.values.columnName]) %}
    {% else %}
      {% set currentField = field.values.Field | fieldData  %}
      {% set tableFields = tableFields|merge([currentField.column_name]) %}
    {% endif %}
  {% endfor %}
  {% set tableData = element.values.variableToUse %}
{% else %}
  {% set table = element.values.table | tableData %}
  {% set tableName = table.name | friendly %}
  {% set tableSingleName = table.singleName | friendly | capitalize %}
  {% set setEditDataFunctionName = 'set' ~ tableName ~ 'Data' %}
  {% set fields = table.fields %}
  {% set innervarname = element.name | friendly %}
  {% set eleWithoutChilds = element %}
  {% set eleWithoutChilds = eleWithoutChilds|merge({'children': null}) %}
  {% include includeTemplate('loadFromRedux.tpl') with { 'data': element.values.table, 'element': eleWithoutChilds, 'defaultPage': element.values.defaultPage } %}
  {% if element.children %}
      {% for field in element.children %}
        {% if field.values.Field == 'useVar' %}
          {% set tableFields = tableFields|merge([field.values.columnName]) %}
        {% else %}
          {% set currentField = field.values.Field | fieldData  %}
          {% set tableFields = tableFields|merge([currentField.displaylabel|default(currentField.column_name)]) %}
        {% endif %}
      {% endfor %}
  {% else %}
      {% set fields = table.fields %}
      {% for field in fields %}
          {% set tableFields = tableFields|merge([field.displaylabel|default(field.column_name)]) %}
      {% endfor %}
  {% endif %}
  {% set tableData = '(' ~ table.name|friendly|lower ~ 'Data.found' ~ table.name|friendly|lower ~ '.length ? ' ~ table.name|friendly|lower ~ 'Data.found' ~ table.name|friendly|lower ~ ' : ' ~ table.name|friendly|lower ~ 'Data.' ~ table.name|friendly|lower ~ ' as any)' %}
  {% set bpr %}
  import { add{{ table.name | friendly | capitalize }}, load{{ table.name | friendly | capitalize }}, remove{{ table.singleName | friendly | capitalize }}, edit{{ table.name | friendly | capitalize }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
  {% endset %}
  {{ save_delayed('bpr', bpr ) }}
{% endif %}

{% set bpr %}
import Icon from '@mdi/react'
import { mdiPencil, mdiDeleteForever } from '@mdi/js'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<div>table</div>