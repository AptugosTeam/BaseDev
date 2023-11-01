/*
name: Data Table
path: dataTable.tpl
unique_id: DJAy2q4b
icon: f:dataTable.svg
helpText: Data table
sourceType: javascript
extraFiles:
  - source: 'elements/Experimental/DataTable/dataTable.tsx'
    destination: 'front-end/components/DataTable/dataTable.tsx'
  - source: 'elements/Experimental/DataTable/table.module.scss'
    destination: 'front-end/components/DataTable/table.module.scss'
  - source: 'elements/Experimental/DataTable/thHeader.tsx'
    destination: 'front-end/components/DataTable/thHeader.tsx'
settings:
  - name: Packages
    value: '"@tanstack/react-table": "8.7.9",'
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [['useVar','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,name }) => [unique_id, name])]
  - name: variableToUse
    display: Variable to use
    type: text
    options: ''
    settings:
      condition: useVar
      propertyCondition: table
  - name: editProcedure
    display: Edit Procedure
    type: dropdown
    options: >-
      return [['No','None'],['Internal','Popup Dialog'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) => [unique_id, name])]
  - name: className
    display: ClassName
    type: styles
    options: ''
  - name: onRequestUpdate
    display: On Update
    type: function
    options: ''
    advanced: true
  - name: onRequestRemove
    display: On Delete
    type: function
    options: ''
    advanced: true
  - name: onColumnRename
    display: On Rename Column
    type: function
    options: ''
    advanced: true
  - name: onColumnRemoval
    display: On Delete Column
    type: function
    options: ''
    advanced: true
  - name: columnInfo
    display: Column Info
    type: code
    options: ''
    advanced: true
  - name: allowEdit
    display: Allow Edition
    type: checkbox
    settings:
      default: true
      condition: ''
*/
{% set allowEdit = element.values.allowEdit|default(true) %}
{% set editProc = element.values.editProcedure|default('No') %}
{% set table = element.values.table | tableData %}
{% set innervarname = 'table' %}
{% set tableName = table.name | friendly %}
{% set tableSingleName = table.singleName | friendly | capitalize %}
{% set setEditDataFunctionName = 'set' ~ tableName ~ 'data' %}
{% set fields = table.fields %}
{% if element.values.table == 'useVar' %}
  {% set tableData = element.values.variableToUse %}
  {% set totalDocs = tableData ~ '.length' %}
{% else %}
  {% set tableData = '(' ~ tableName|lower ~ 'Data.found' ~ tableName|lower ~ '.length ? ' ~ tableName|lower ~ 'Data.found' ~ tableName|lower ~ ' : ' ~ tableName|lower ~ 'Data.' ~ tableName|lower ~ ' as any)' %}
  {% set eleWithoutChilds = element %}
  {% set eleWithoutChilds = eleWithoutChilds|merge({'children': null,'name':'table'}) %}
  {% include includeTemplate('loadFromRedux.tpl') with { 'data': element.values.table, 'element': eleWithoutChilds, 'defaultPage': element.values.defaultPage } %}
  {% set totalDocs = (tableName|lower) ~ 'Data.totalDocs' %}
{% endif %}
{% set bpr %}
import DataTable from '../components/DataTable/dataTable'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<DataTable
  {% if element.values.onRequestUpdate %}
  onRequestUpdate={ {{ element.values.onRequestUpdate | functionOrCall }} }
  {% endif %}
  {% if element.values.onRequestRemove %}
  onRequestRemove={ {{ element.values.onRequestRemove | functionOrCall }} }
  {% endif %}
  {% if element.values.onColumnRemoval %}
  onColumnRemoval={ {{ element.values.onColumnRemoval | functionOrCall }} }
  {% endif %}
  {% if element.values.onColumnRename %}
  onColumnRename={ {{ element.values.onColumnRename | functionOrCall }} }
  {% endif %}
  {% if element.values.className %}
    className={ {{element.values.className}} }
  {% endif %}
  tableData={ {{ tableData }} }
  pages={Math.ceil({{ totalDocs }} / {{ innervarname }}loadoptions.limit)}
  columnInfo={
    {% if element.values.columnInfo %}
      {{ element.values.columnInfo }}
    {% else %}
    [
      {% if not element.children %}
        {% for field in fields %}
          {% set innerParams = { 'element': { values: { 'Field': field.unique_id } } } %}
          {% include includeTemplate('dtfield.tpl') with innerParams %}
        {% endfor %}
      {% endif %}
      {% for child in element.children %}
        {{ child.rendered }}
      {% endfor %}
    ]
    {% endif %}
  }
  onRequestPaginate={(options) => {
    set{{ innervarname }}loadoptions({ ...{{ innervarname }}loadoptions, ...options })
  }}
  {% if allowEdit %}
  onRequestEdit={row => {
    {% if editProc == 'Internal' %}
      {{ setEditDataFunctionName }}(row)
      setdialog{{ tableName|capitalize }}Action('edit')
    {% else %}
      const url = '{{ (editProc | elementData ).path }}'.replace(':id', row._id)
      props.history.push(url)
    {% endif %}
  }}
  {% endif %}
  {% if allowEdit %}
  onRequestRemove={row => {
    dispatch(remove{{ tableSingleName }}(row))
  }}
  {% endif %}
  onRequestSort={property => {
    set{{ innervarname }}loadoptions({
      ...{{ innervarname }}loadoptions,
      sort: {
        field: property,
        method: {{ innervarname }}loadoptions.sort.field === property ? ({{ innervarname }}loadoptions.sort.method === 'asc' ? 'desc' : 'asc') : 'asc',
      }
    })
  }}
/>