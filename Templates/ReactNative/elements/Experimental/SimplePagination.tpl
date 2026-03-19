/*
path: SimplePagination.tpl
completePath: elements/Experimental/SimplePagination.tpl
type: file
unique_id: Ip36BC3c
icon: ico-pagination
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
{% set ph %}
const [pagination, setPagination] = React.useState({
    itemsPerPage: {{ element.values.elementsLimit|default(10) }},
    currentPage: {{ element.values.currentPage|default(1) }},
    totalItems: {{ element.values.totalItems|default(0) }}
})

React.useEffect(() => {
  setPagination({ ...pagination, totalItems: {{ element.values.variableToUse }}.totalDocs })
}, [{{ element.values.variableToUse }}])

React.useEffect(() => {
  dispatch(load{{ (element.values.table|tableData).name | friendly | capitalize }}({ page: pagination.currentPage, limit: pagination.itemsPerPage }))
}, [pagination.currentPage])

{% endset %}
{{ save_delayed('ph',ph) }}
<Pagination
    itemsPerPage={pagination.itemsPerPage}
    currentPage={pagination.currentPage}
    setPage={(page) => { setPagination({ ...pagination, currentPage: page })}}
    totalItems={pagination.totalItems}
/>

