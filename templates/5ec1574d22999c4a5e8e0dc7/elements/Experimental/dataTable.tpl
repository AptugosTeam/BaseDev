/*
path: dataTable.tpl
type: file
unique_id: dsfjsdfh
icon: f:dataTable.svg
helpText: Data table
sourceType: javascript
children: []
extraFiles:
  - source: 'elements/Experimental/DataTable/index.js'
    destination: 'front-end/components/DataTable/index.js'
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id, name }) => [unique_id, name])]
    settings:
      aptugoOnLoad: |-
        const element = arguments[0]
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        const varsToAdd = {
          [aptugo.friendly(element.name) + 'loadoptions']: {
            page: 1,
            populate: true,
            limit: 25,
            sort: {},
            totalItems: 0,
            searchString: null,
            searchField: null
          }
        }
        aptugo.variables.setPageVariable(page, element.unique_id,varsToAdd);
        aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${aptugo.friendly(element.name)}loadoptions` );
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
settings:
  - name: Packages
    value: '"react-data-table-component": "latest","styled-components": "latest",'
*/
{% set innervarname = element.name | friendly %}
{% set table = element.values.table | tableData %}
{% set fields = table.fields %}
{% set allowEdit = element.values.allowEdit|default(true) %}
{% set allowDeletion = element.values.allowDeletion|default(true) %}

{% include includeTemplate('loadFromRedux.tpl') with { 'data': element.values.table, 'element': element} %}

{% set bpr %}
import DataTables from '../components/DataTable'
{% endset %}
{{ save_delayed('bpr',bpr) }}

<DataTables
  tableData={bugsData.foundbugs.length ? bugsData.foundbugs : (bugsData.bugs as any)}
  columns={[
    {% if element.children %}{{ content | raw }}{% else %}
      {% for field in fields %}
        {% set innerParams = { 'element': { values: { 'Field': field.unique_id } } } %}
        {% include includeTemplate('dtfield.tpl') with innerParams %}
      {% endfor %}
    {% endif %}
    {% if allowEdit %}
      {% set bpr %}
        import IconButton from '@mui/material/IconButton'
      {% endset %}
      {{ save_delayed('bpr', bpr ) }}
      {% set bpr %}
        import EditIcon from '@mui/icons-material/Edit'
      {% endset %}
      {{ save_delayed('bpr', bpr ) }}
    ,{
      name: 'Edit',
      button: true,
      cell: (fieldData) => <IconButton aria-label="edit" color="primary" onClickCapture={(e: any) => {
        setBugsData(fieldData)
        setdialogBugsAction('edit')
      }} >
        <EditIcon fontSize="small" />
      </IconButton>
    }
    {% endif %}
    {% if allowDeletion %}
      {% set bpr %}
        import IconButton from '@mui/material/IconButton'
      {% endset %}
      {{ save_delayed('bpr', bpr ) }}
      {% set bpr %}
        import DeleteIcon from '@mui/icons-material/Delete'
      {% endset %}
      {{ save_delayed('bpr', bpr ) }}
    ,{
      name: 'Delete',
      button: true,
      cell: (fieldData) => <IconButton
        aria-label="delete"
        color="primary"
        onClickCapture={(e: any) => {
          dispatch(removeBug(fieldData))
        }}
      >
        <DeleteIcon fontSize="small" />
      </IconButton>
    }
    {% endif %}
  ]}
  handlePageChange={(newpage) => { set{{ innervarname }}loadoptions({ ...{{ innervarname }}loadoptions, page: newpage })}}
  handleRowsPerPageChange={(perPage,page) => { set{{ innervarname }}loadoptions({ ...{{ innervarname }}loadoptions, page: page, limit: perPage })}}
  handleSortChange={(column,direction) => { set{{ innervarname }}loadoptions({ ...{{ innervarname }}loadoptions, sort: { field: column.selector, method: direction } })}}
  totalDocs={ {{ table.name | friendly | lower ~ 'Data' }}.totalDocs}
/>
