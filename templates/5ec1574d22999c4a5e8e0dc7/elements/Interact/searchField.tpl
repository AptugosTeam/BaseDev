/*
path: searchField.tpl
type: file
unique_id: i13FZRpA
icon: ico-flick-search
helpText: Adds a search field and performs searches on a specific table when changed
children: []
options:
  - name: table
    display: Table
    type: dropdown
    options: >-
      return [['var','Use a
      variable'],...aptugo.store.getState().application.tables.map(({ unique_id,
      name }) => [unique_id, name])]
  - name: avoidLoad
    display: Do not load data
    type: checkbox
  - name: placeholderText
    display: Placeholder Text
    type: text
  - name: searchField
    display: Search Field
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
*/
{% set table = element.values.table | tableData %}
{% set bpr %}
  import { useDispatch } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const dispatch = useDispatch()
{% endset %}
{{ save_delayed('ph', ph ) }}
{% set bpr %}
import { load{{ table.name | friendly | capitalize }}, search{{ table.name | friendly | capitalize }} } from '../store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
let searchTimeout = null
const searchFor{{ table.name | friendly }} = (event) => {
    if (searchTimeout) clearTimeout(searchTimeout)
    searchTimeout = setTimeout(() => {
      settableloadoptions({
        ...tableloadoptions,
        searchString: event.target.value,
        {% if element.values.searchField %}searchField: '{{ (element.values.searchField | fieldData).column_name }}'{% endif %}
      })
    },500)
}
{% endset %}
{{ save_delayed('ph',ph)}}
{% if not element.values.avoidLoad %}
  {% include includeTemplate('loadFromRedux.tpl') with { 'data': element.values.table, 'element': element} %}
{% endif %}
{% set searchFieldParams = { element: { values: { onChange: 'searchFor' ~ table.name|friendly, placeholder: element.values.placeholderText | default('Search ' ~ table.singleName|friendly ~ '...'), variant: 'outlined', margin: 'normal', className: 'theme.extensibleInput' } } } %}
{% include includeTemplate('uncontrolledInput.tpl') with searchFieldParams %}