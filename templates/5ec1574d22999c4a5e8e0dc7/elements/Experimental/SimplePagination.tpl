/*
path: SimplePagination.tpl
completePath: elements/Experimental/SimplePagination.tpl
type: file
unique_id: Ip36BC3c
icon: f:SimplePagination.svg
options:
  - name: itemsPerPage
    display: Items per Page
    type: text
    options: ''
  - name: currentPage
    display: Current Page
    type: text
    options: ''
  - name: totalItems
    display: Total Items
    type: text
    options: ''
  - name: variableToUse
    display: Use Variable
    type: text
  - name: table
    display: Table
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
children: []
*/
{% set bpr %}
import Pagination from '../components/Pagination'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Pagination
    itemsPerPage={tableloadoptions.limit}
    currentPage={tableloadoptions.page}
    setPage={(page) => { settableloadoptions({ ...tableloadoptions, page: page })}}
    totalItems={ {{ element.values.variableToUse }}.totalDocs}
/>
