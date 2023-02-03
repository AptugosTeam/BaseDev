/*
path: tanstackTable.tpl
type: file
unique_id: IUyfyalR
icon: ico-table
sourceType: javascript
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
    value: '"@tanstack/react-table": "8.7.9",'
  - name: Packages
    value: '"react": "^18.2.0",'
  - name: Packages
    value: '"react-dom": "^18.2.0",'
*/

{% set bpr %}
  import Tanstack from '../components/TanstackTable/Tanstack'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
<Tanstack><div>Hola</div></Tanstack>
