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
      return [...aptugo.store.getState().application.tables.map(({ unique_id, name }) => [unique_id, name])]
  - name: editProcedure
    display: Edit Procedure
    type: dropdown
    options: >-
      return [['No','None'],['Internal','Popup Dialog'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) => [unique_id, name])]
*/
{% set editProc = element.values.editProcedure|default('No') %}
{% set table = element.values.table | tableData %}
{% set innervarname = 'table' %}
{% set tableName = table.name | friendly %}
{% set tableSingleName = table.singleName | friendly | capitalize %}
{% set setEditDataFunctionName = 'set' ~ tableName ~ 'Data' %}
{% set fields = table.fields %}
{% set tableData = '(' ~ tableName|lower ~ 'Data.found' ~ tableName|lower ~ '.length ? ' ~ tableName|lower ~ 'Data.found' ~ tableName|lower ~ ' : ' ~ tableName|lower ~ 'Data.' ~ tableName|lower ~ ' as any)' %}

{% set bpr %}
import DataTable from '../components/DataTable/dataTable'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<DataTable
  tableData={ {{ tableData }} }
  columnInfo={[
    {% for field in fields %}
      {% set innerParams = { 'element': { values: { 'Field': field.unique_id } } } %}
      {% include includeTemplate('dtfield.tpl') with innerParams %}
    {% endfor %}
  ]}
  onRequestEdit={row => {
    {% if editProc == 'Internal' %}
      {{ setEditDataFunctionName }}(row)
      setdialog{{ tableName|capitalize }}Action('edit')
    {% else %}
      const url = '{{ (editProc | elementData ).path }}'.replace(':id', e.element._id)
      props.history.push(url)
    {% endif %}
  }}
  onRequestRemove={row => {
    dispatch(remove{{ tableSingleName }}(row))
  }}
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