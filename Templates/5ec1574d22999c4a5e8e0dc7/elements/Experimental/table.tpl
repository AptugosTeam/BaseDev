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
      return [['useVar','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
    required: true
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
      return [['No','None'],['custom', 'Custom'],['Internal','Popup Dialog'],...aptugo.pageUtils.plainpages.map(({unique_id, name }) => [unique_id, name])]
  - name: customUrl
    display: Url for Edit
    type: text
    options: ''
    settings:
      propertyCondition: editProcedure
      condition: custom
      active: true
  - name: allowEdit
    display: Allow Edition
    type: checkbox
    settings:
      default: true
      condition: ''
  - name: allowView
    display: Allow View
    type: checkbox
    settings:
      default: false
      condition: ''
  - name: editionTable
    display: Table used in Edits (or deletes)
    type: dropdown
    options: >-
      return [...aptugo.store.getState().application.tables.map(({ unique_id,name }) => [unique_id, name])]
  - name: allowDeletion
    display: Allow Deletion
    type: checkbox
    settings:
      default: true
      condition: ''
  - name: useSoftDelete
    display: Use Soft Delete
    type: checkbox
    settings:
      default: false
      condition: ''
  - name: variableToCheck
    display: Variable to check before fetching
    type: text
    options: ''
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
  - name: rowClassName
    display: ClassName for the row
    type: styles
    options: ''
  - name: usePagination
    display: Use Pagination
    type: checkbox
    options: ''
    settings:
      default: false
  - name: startSeparatorPagination
    display: Start Pagination Properties
    type: separator
    settings:
      propertyCondition: usePagination
      condition: true
  - name: elementsLimit
    display: Elements Per Page
    type: text
    options: ''
    settings:
      default: '10'
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: alwaysActivePrevButton
    display: Always Active Previous Button?
    type: checkbox
    options: ''
    settings: 
      default: false
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: alwaysActiveNextButton
    display: Always Active Next Button?
    type: checkbox
    options: ''
    settings:
      default: false
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: disabledPrevButton
    display: Disable Previous Button
    type: checkbox
    options: ''
    settings:
      default: false
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: disabledNextButton
    display: Disable Next Button
    type: checkbox
    options: ''
    settings:
      default: false
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: textInsidePrevButton
    display: Text Inside the Previous Button
    type: text
    options: ''
    settings:
      default: 'Previous'
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: textInsideNextButton
    display: Text Inside the Next Button
    type: text
    options: ''
    settings:
      default: 'Next'
      propertyCondition: usePagination
      condition: '"true"'
      active: true
  - name: endSeparatorPagination
    display: End Pagination Properties
    type: separator
    settings:
      propertyCondition: usePagination
      condition: true
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
  - name: onRowClick
    display: On Row Click
    type: text
    options: ''
    settings:
      default: ''  
children: []
*/
{% set editProc = element.values.editProcedure|default('No') %}
{% set allowEdit = element.values.allowEdit|default(true) %}
{% set allowView = element.values.allowView|default(false) %}
{% set allowDeletion = element.values.allowDeletion|default(true) %}
{% set useSoftDelete = element.values.useSoftDelete|default(false) %}
{% set tableFields = [] %}
{% if element.values.table == 'useVar' or element.values.table == 'var' %}
  {% set table = element.values.editionTable | tableData %}
  {% set tableName = table.name | friendly %}
  {% set tableSingleName = table.singleName | friendly | capitalize %}
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
  {% set table = element.values.table | tableData %}
  {% set tableName = table.name | friendly %}
  {% set tableSingleName = table.singleName | friendly | capitalize %}
  {% set setEditDataFunctionName = 'set' ~ tableName ~ 'data' %}
  {% set fields = table.fields %}
  {% set innervarname = element.name | friendly %}
  {% set eleWithoutChilds = element %}
  {% set eleWithoutChilds = eleWithoutChilds|merge({'children': null}) %}
  {% include includeTemplate('loadFromRedux.tpl') with { 'data': element.values.table, 'element': eleWithoutChilds, 'defaultPage': element.values.defaultPage, 'sortColumn':element.values.sortColumn, sortMethod: element.values.sortMethod, 'fixedSearchField': element.values.fixedSearchField, 'fixedSearchString': element.values.fixedSearchString, 'variableToCheck': element.values.variableToCheck } %}
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
  import { add{{ table.name | friendly | capitalize }}, load{{ table.name | friendly | capitalize }}, remove{{ table.singleName | friendly | capitalize }},{% if useSoftDelete %} softRemove{{ table.name | friendly | capitalize }},{% endif %} edit{{ table.name | friendly | capitalize }}, view{{ table.name | friendly | capitalize }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
  {% endset %}
  {{ save_delayed('bpr', bpr ) }}
{% endif %}

{% set bpr %}
  import Table from '../components/Table/Table'
  import EditIcon from '@mui/icons-material/Edit'
  import VisibilityIcon from '@mui/icons-material/Visibility'
  import DeleteIcon from '@mui/icons-material/Delete'
  import IconButton from '@mui/material/IconButton'
  import {{ element.values.icon | default('More') }}Icon from '@mui/icons-material/{{ element.values.icon | default('More') }}'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Table    
    tableHead={
      {% if element.values.headerVariable %}
        {{element.values.headerVariable}}
      {% else %}
        [{% for field in tableFields %}"{{ field }}",{% endfor %}{% if editProc != 'No' or allowEdit or allowView or allowDeletion %}"Actions"{% endif %}]
      {% endif %}
    }
    tableData={ {{ tableData }} }
    {% if element.values.rowClassName %}
      rowClassName={ {{element.values.rowClassName}} }
    {% endif %}
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
    onRowClick={(rowData) => {
    {% if element.values.onRowClick and element.values.onRowClick != '' %}
      {{ element.values.onRowClick }}
    {% else %}
      return;
    {% endif %}
    }}
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
      color="inherit"
      onClickCapture={(e: any) => { 
        const url = '{{ (element.values.detailsURL | elementData ).path }}'.replace(':id', e.element._id)
        props.history.push(url)
      } }
    >
      <{{element.values.icon | default('More')}}Icon fontSize="small" />
    </IconButton>
    {% endif %}
    {% if allowView %}
    <IconButton
      aria-label="View"
      color="primary"
      onClickCapture={(e: any) => { 
        {% if editProc == 'Internal' %}
          {{ setEditDataFunctionName }}(e.element)
          setdialog{{ tableName | capitalize }}Action('view')
          {% elseif element.values.customUrl %}
          const url = `{{ element.values.customUrl }}`
          props.history.push(url)
        {% else %}
          const url = '{{ (editProc | elementData ).path }}'.replace(':id', e.element._id)
          props.history.push(url)
        {% endif %}
      } }
    >
      <VisibilityIcon fontSize="small" />
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
          {% elseif element.values.customUrl %}
          const url = `{{ element.values.customUrl }}`
          props.history.push(url)
        {% else %}
          const url = '{{ (editProc | elementData ).path }}'.replace(':id', e.element._id)
          props.history.push(url)
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
        setdialog{{ tableName | capitalize }}Action({% if useSoftDelete %}'softDelete'{% else %}'delete'{% endif %})
      {% else %}
        dispatch({% if useSoftDelete %}softRemove{{ tableName | capitalize }}{% else %}remove{{ tableSingleName }}{% endif %} (e.element))
      {% endif %}
    }}>
      <DeleteIcon fontSize="small" />
    </IconButton>
    {% endif %}
</div>
{% endif %}
</Table>
{% if element.values.usePagination %}
{% set innerParams = { 'element': { 'unique_id': item.unique_id, values: { 'variableToUse': table.name | friendly | lower ~ 'Data', 'table': element.values.table, 'elementsLimit': element.values.elementsLimit, 'totalDocs': element.values.variableToUse.totalDocs, 'alwaysActivePrevButton': element.values.alwaysActivePrevButton, 'alwaysActiveNextButton': element.values.alwaysActiveNextButton, 'disabledPrevButton': element.values.disabledPrevButton, 'disabledNextButton': element.values.disabledNextButton, 'textInsidePrevButton': element.values.textInsidePrevButton, 'textInsideNextButton': element.values.textInsideNextButton } } } %}
{% include includeTemplate('SimplePagination.tpl') with innerParams %}
{% endif %}
