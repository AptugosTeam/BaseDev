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
    {% if element.values.minPage %}
      minPage={ {{element.values.minPage}} }
    {% endif %}
    {% if element.values.alwaysActivePrevButton %}
      alwaysActivePrevButton={ {{element.values.alwaysActivePrevButton}} }
    {% endif %}
    {% if element.values.alwaysActiveNextButton %}
      alwaysActiveNextButton={ {{element.values.alwaysActiveNextButton}} }
    {% endif %}
    {% if element.values.disabledPrevButton %}
      disabledPrevButton={tableloadoptions.page == 1}
    {% endif %}
    {% if element.values.disabledNextButton %}
      disabledNextButton={emisionsourcesData.totalDocs < tableloadoptions.page * tableloadoptions.limit}
    {% endif %}
    {% if element.values.textInsidePrevButton %}
      textInsidePrevButton={{ element.values.textInsidePrevButton | textOrVariable}} 
    {% endif %}
    {% if element.values.textInsideNextButton %}
      textInsideNextButton={{ element.values.textInsideNextButton | textOrVariable }}
    {% endif %}
/>
