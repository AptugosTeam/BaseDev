/*
path: table.tpl
type: file
unique_id: IUyfyTiR
icon: ico-table
sourceType: javascript
renderTag: 'table'
deprecated: true
deprecatedText: This element will not be maintained, switch over to DataTable
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
      return [['useVar','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: variableToUse
    display: Variable to use
    type: text
    options: ''
    settings:
      condition: useVar
      propertyCondition: table
  - name: headerVariable
    display: Variable to use in Header
    type: text
    options: ''
    settings:
      condition: useVar
      propertyCondition: table    
  - name: header
    display: Use header variable
    type: checkbox
    settings:
      propertyCondition: table
      conditionNegate: true
      active: true   
      condition: useVar
  - name: headerVariable
    display: Variable to use in Header
    type: text
    options: ''
    settings:
      condition: true
      propertyCondition: header
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
  - name: icon
    display: Icon
    type: dropdown
    options: >-
      More;MoreVert
    settings: 
      default: More
  - name: searchString
    display: Search String
    type: text
    options: ''
  - name: usePagination
    display: Use Pagination
    type: checkbox
    options: ''
    settings:
      default: false
  - name: elementsLimit
    display: Elements Per Page
    type: text
    options: ''
    settings:
      default: '10'
      propertyCondition: usePagination
      condition: true
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
  - name: sortColumn
    display: Sort Column
    type: text
    options: ''
  - name: sortMethod
    display: Sort Method
    type: dropdown
    options: desc;asc
children: []
*/
{# Definitions #}
{% set allowDeletion = element.values.allowDeletion|default(true) %}
{% set allowEdit = element.values.allowEdit|default(true) %}
{% set editProc = element.values.editProcedure|default('No') %}
{% set tableFields = [] %}
{% if element.values.table == 'useVar' or element.values.table == 'var' %}
  {% set table = element.values.editionTable | tableData %}
  {% set tableName = table.name | friendly %}
  {% set setEditDataFunctionName = 'set' ~ tableName ~ 'data' %}
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
  {% set innervarname = element.name | friendly %}
  {% set eleWithoutChilds = element|merge({'children': null}) %}

  {% set table = element.values.table | tableData %}
  {% set fields = table.fields %}

  {% set tableName = table.name | friendly %}
  {% set singleName = table.singleName | friendly | lower %}
  {% set tableData = singleName ~ 'data?.data.docs' %}
  {% set setEditDataFunctionName = 'set' ~ tableName ~ 'data' %}
  
  {% include includeTemplate('loadFromRedux.tpl') with {
    'data': element.values.table,
    'element': eleWithoutChilds,
    'defaultPage': element.values.defaultPage,
    'sortColumn': element.values.sortColumn,
    'sortMethod': element.values.sortMethod,
    'elementsLimit': element.values.elementsLimit,
    'fixedSearchField': element.values.fixedSearchField,
    'fixedSearchString': element.values.fixedSearchString
  } %}

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
{% endif %}
{% set bpr %}
  import Table from '@components/Table/Table'
  import EditIcon from '@mui/icons-material/Edit'
  import DeleteIcon from '@mui/icons-material/Delete'
  import IconButton from '@mui/material/IconButton'
  import {{ element.values.icon | default('More') }}Icon from '@mui/icons-material/{{ element.values.icon | default('More') }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{# Output  #}
<Table    
  tableHead={
    {% if element.values.headerVariable %}{{element.values.headerVariable}}
    {% else %}[{% for field in tableFields %}"{{ field }}",{% endfor %}{% if editProc != 'No' or allowEdit or allowDeletion %}"Actions"{% endif %}]
    {% endif %}
  }
  tableData={ {{ tableData }} }
  {% if element.values.table != 'useVar' and element.values.table != 'var' %}
    orderBy={ {{ innervarname }}loadoptions.sort.field }
    order={ {{ innervarname }}loadoptions.sort.method }
    onRequestSort={(event, property) => {
      set{{ innervarname }}loadoptions({
        ...{{ innervarname }}loadoptions,
        sort: {
          field: property,
          method: {{ innervarname }}loadoptions.sort.field === property ? ({{ innervarname }}loadoptions.sort.method === 'asc' ? 'desc' : 'asc') : 'ASC',
        }
      })
    }}
  {% endif %}
>
  {% if element.children %}
    {{ content | raw }}
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
          color="inherit"
          onClickCapture={(e: any) => { 
            const url = '{{ (element.values.detailsURL | elementData ).path }}'.replace(':id', e.element._id)
            props.history.push(url)
          } }
        >
          <{{element.values.icon | default('More')}}Icon fontSize="small" />
        </IconButton>
      {% endif %}
      {% if allowEdit %}
        <IconButton
          aria-label="edit"
          color="primary"
          onClickCapture={(e: any) => {
            {% if editProc != 'Internal' %}
              const url = '{{ (editProc | elementData ).path }}'.replace(':id', e.element._id)
              props.history.push(url)
            {% else %}
              {{ setEditDataFunctionName }}(e.element)
              setdialog{{ tableName | capitalize }}Action('edit')
            {% endif %}
          } }
        >
          <EditIcon fontSize="small" />
        </IconButton>
      {% endif %}
    {% if allowDeletion %}
    <IconButton aria-label="delete" color="primary" onClickCapture={(e: any) => {
      {% if element.values.confirmDeletes %}
        {{ setEditDataFunctionName }}(e.element)
        setdialog{{ tableName | capitalize }}Action('delete')
      {% else %}
        
      {% endif %}
    }}>
      <DeleteIcon fontSize="small" />
    </IconButton>
    {% endif %}
</div>
{% endif %}
</Table>
{% if element.values.usePagination %}
  {% set tablePagination = 'var:' ~ singleName ~ 'data?.data.totalDocs' %}
  {% set innerParams = {
    'element': {
      'unique_id': item.unique_id,
      values: {
        'variableToUse': singleName ~ 'data',
        'table': element.values.table,
        'elementsLimit': element.values.elementsLimit,
        'totalItems': (tablePagination|textOrVariable)
      }
    } }
  %}
  {% include includeTemplate('SimplePagination.tpl') with innerParams %}
{% endif %}
