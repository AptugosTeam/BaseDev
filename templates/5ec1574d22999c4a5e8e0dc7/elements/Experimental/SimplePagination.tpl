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
  - name: setPage
    display: On Change Page
    type: function
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
  - name: alwaysActivePrevButton
    display: Always Active Previous Button?
    type: checkbox
    options: ''
    settings: 
      default: false
  - name: alwaysActiveNextButton
    display: Always Active Next Button?
    type: checkbox
    options: ''
    settings:
      default: false
  - name: disabledPrevButton
    display: Disable Previous Button
    type: checkbox
    options: ''
    settings:
      default: false
  - name: disabledNextButton
    display: Disable Next Button
    type: checkbox
    options: ''
    settings:
      default: false
  - name: disabledPrevButtonFunction
    display: Disabled Previous Button Function
    type: function
    options: ''
    settings:
      propertyCondition: disabledPrevButton
      condition: false
  - name: disabledNextButtonFunction
    display: Disabled Next Button Function
    type: function
    options: ''
    settings:
      propertyCondition: disabledNextButton
      condition: false
  - name: textInsidePrevButton
    display: Text Inside the Previous Button
    type: text
    options: ''
    settings:
      default: 'Previous'
      active: true
  - name: textInsideNextButton
    display: Text Inside the Next Button
    type: text
    options: ''
    settings:
      default: 'Next'
  - name: useVariable
    display: Use custom variable 
    type: checkbox
    options: ''
    settings:
      default: false
children: []
*/
{% set bpr %}
import Pagination from '../components/Pagination'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<Pagination
    itemsPerPage={ {{element.values.itemsPerPage | default('tableloadoptions.limit')}} }
    currentPage={ {{element.values.currentPage | default('tableloadoptions.page')}} }
    setPage={(page) => { {{element.values.setPage | default('settableloadoptions({ ...tableloadoptions, page: page })') }} } }
    totalItems={
      {% if element.values.useVariable %}
      {{element.values.variableToUse}}
      {% else %}
      {{element.values.variableToUse}}.totalDocs
      {% endif %}
    }
    {% if element.values.minPage %}
      minPage={ {{element.values.minPage}} }
    {% endif %}
    {% if element.values.alwaysActivePrevButton %}
      alwaysActivePrevButton={ {{element.values.alwaysActivePrevButton}} }
    {% endif %}
    {% if element.values.alwaysActiveNextButton %}
      alwaysActiveNextButton={ {{element.values.alwaysActiveNextButton}} }
    {% endif %}
    {% if not element.values.disabledPrevButton %}
      disabledPrevButton={ {{ element.values.disabledPrevButtonFunction | default('tableloadoptions.page == 1') }} }
    {% endif %}
    {% if not element.values.disabledNextButton %}
      disabledNextButton={
        {% if element.values.useVariable %}
         {{ element.values.disabledNextButtonFunction }}
        {% else %}
         {{ element.values.variableToUse }}.totalDocs < tableloadoptions.page * tableloadoptions.limit
        {% endif %} 
        }
    {% endif %}
    {% if not element.values.textInsidePrevButton %}
      textInsidePrevButton={{ element.values.textInsidePrevButton | default('Previous') | textOrVariable }} 
    {% endif %}
    {% if not element.values.textInsideNextButton %}
      textInsideNextButton={{ element.values.textInsideNextButton | default('Next') | textOrVariable }}
    {% endif %}
/>
