/*
path: table.tpl
type: file
unique_id: IUyfyTiR
icon: ico-table
sourceType: javascript
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
      default: 'true'
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
children: []
*/

{% set editProc = element.values.editProcedure|default('No') %}
{% set allowEdit = element.values.allowEdit|default(true) %}
{% set allowDeletion = element.values.allowDeletion|default(true) %}
{% set tableFields = [] %}
{% if element.values.table == 'var' %}
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

  {% include includeTemplate('loadFromRedux.tpl') with { 'data': element.values.table, 'element': element} %}

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
  import { IconButton, Colors } from 'react-native-paper'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
  import Table from '../components/Table/Table'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Table    
    tableHead={
      {% if element.values.headerVariable %}
        {{element.values.headerVariable}}
      {% else %}
        [{% for field in tableFields %}"{{ field }}",{% endfor %}{% if editProc != 'No' or allowEdit or allowDeletion %}"Actions"{% endif %}]
      {% endif %}
    }
    tableData={ {{ tableData }} }
    {% if element.values.table != 'var' %}
      orderBy={ {{ table.name | friendly }}loadoptions.sort.field }
      order={ {{ table.name | friendly }}loadoptions.sort.method }
      onRequestSort={(event, property) => {
        set{{ table.name | friendly }}loadoptions({
          ...{{ table.name | friendly }}loadoptions,
          sort: {
            field: property,
            method: {{ table.name | friendly }}loadoptions.sort.field === property ? ({{ table.name | friendly }}loadoptions.sort.method === 'asc' ? 'desc' : 'asc') : 'ASC',
          }
        })
      }}
    {% endif %}
>{% if element.children %}
  {{ content | raw }}
{% else %}
{% for field in fields %}
  {% set innerParams = { 'element': { values: { 'Field': field.unique_id } } } %}
  {% include includeTemplate('field.tpl') with innerParams %}
{% endfor %}
{% endif %}
{% if editProc != 'No' %}
<div className={classes.actionsArea}>
    {% if element.values.detailsURL and element.values.detailsURL != 'No' %}
    <IconButton
      aria-label="edit"
      color="primary"
      onClickCapture={(e: any) => { 
        const url = '{{ (element.values.detailsURL | elementData ).path }}'.replace(':id', e.element._id)
        props.history.push(url)
      }}
    >
      <MoreIcon fontSize="small" />
    </IconButton>
    {% endif %}
    {% if allowEdit %}
    <IconButton
      aria-label="edit"
      color="primary"
      onClickCapture={(e: any) => { 
        {% if editProc == 'Internal' %}
          {{ setEditDataFunctionName }}(e.element)
          setdialog{{ tableName | capitalize }}Action('edit')
        {% else %}
          const url = '{{ (editProc | elementData ).path }}'.replace(':id', e.element._id)
          props.history.push(url)
        {% endif %}
      }}
    >
      <IconButton size="small" icon="Edit" />
    </IconButton>
    {% endif %}
    {% if allowDeletion %}
    <IconButton aria-label="delete" color="primary" icon="Delete" onClickCapture={(e: any) => {
      {% if element.values.confirmDeletes %}
        {{ setEditDataFunctionName }}(e.element)
        setdialog{{ tableName | capitalize }}Action('delete')
      {% else %}
        dispatch(remove{{ tableSingleName }} (e.element))
      {% endif %}
    }}>
    </IconButton>
    {% endif %}
</div>
{% endif %}
</Table>
{% if element.values.usePagination %}
{% set innerParams = { 'element': { 'unique_id': item.unique_id, values: { 'variableToUse': table.name | friendly | lower ~ 'Data', 'table': element.values.table, 'elementsLimit': element.values.elementsLimit, 'totalDocs': element.values.variableToUse.totalDocs } } } %}
{% include includeTemplate('SimplePagination.tpl') with innerParams %}
{% endif %}
