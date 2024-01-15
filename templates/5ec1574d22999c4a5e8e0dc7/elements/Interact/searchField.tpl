/*
path: searchField.tpl
type: file
unique_id: i13FZRpA
icon: f:searchField.svg
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
  - name: updateVarName
    display: Update Variable Name
    type: dropdown
    options: >-
      return [['default','Use default name'], ...aptugo.variables.variables.filter(v => v.type !== 'Function').map(v => [v.name, v.name])]
  - name: updateFunctionName
    display: Update Function Name
    type: dropdown
    options: >-
      return [['default','Use default name'], ...aptugo.variables.variables.filter(v => v.type === 'Function').map(v => [v.name, v.name])]
*/
{% set updateFunctionName = element.values.updateFunctionName|default('settableloadoptions') %}
{% if updateFunctionName == 'default' %}{% set updateFunctionName = 'settableloadoptions' %}{% endif %}
{% set updateVarName = element.values.updateVarName|default('tableloadoptions') %}
{% if updateVarName == 'default' %}{% set updateVarName = 'tableloadoptions' %}{% endif %}
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
const searchFor{{ table.name | friendly }} = (event, field = null) => {
    if (searchTimeout) clearTimeout(searchTimeout)
    searchTimeout = setTimeout(() => {
      {{updateFunctionName}}({
        ...{{updateVarName}},
        searchString: event.target.value,
        searchField: field
      })
    },500)
}
{% endset %}
{{ save_delayed('ph',ph)}}
{% if not element.values.avoidLoad %}
  {% include includeTemplate('loadFromRedux.tpl') with { 'data': element.values.table, 'element': element} %}
{% endif %}
{% if element.values.searchField %}
  {% set searchFieldParams = {
    element: {
      values: { 
        onChange: '(e) => { searchFor' ~ table.name|friendly  ~ '(e, "' ~ (element.values.searchField | fieldData).column_name ~ '") }', placeholder: element.values.placeholderText | default('Search ' ~ table.singleName|friendly ~ '...'), variant: 'outlined', size: 'small', margin: 'dense', className: 'theme.extensibleInput', id:'searchField-' ~ table.singleName|friendly ~ '-' ~ (element.values.searchField | fieldData).column_name } } } %}
{% else %}
  {% set searchFieldParams = { element: { values: { onChange: 'searchFor' ~ table.name|friendly, placeholder: element.values.placeholderText | default('Search ' ~ table.singleName|friendly ~ '...'), variant: 'outlined', size: 'small', margin: 'dense', className: 'theme.extensibleInput', id:'searchField-' ~ table.singleName|friendly ~ '-' ~ (element.values.searchField | fieldData).column_name } } } %}
{% endif %}
{% include includeTemplate('uncontrolledInput.tpl') with searchFieldParams %}


