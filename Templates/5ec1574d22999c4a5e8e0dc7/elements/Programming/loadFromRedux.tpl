/*
path: loadFromRedux.tpl
display: Load from Database
completePath: elements/Programming/loadFromRedux.tpl
type: file
unique_id: 2uzdPTtK
icon: ico-load-redux
sourceType: javascript
calculatedName: >-
  function (ele) { 
    try {
      const tblname = aptugo.store.getState().application.tables.find(tbl => tbl.unique_id === ele.values.data).name
      const calc = 'Load ' + tblname + ' from database'
      return calc
    } catch(e) {
      return ele.name
    }
  }
options:
  - name: data
    display: Data
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
    settings:
      aptugoOnLoad: |-
        const element = arguments[0];
        if ( element.values.data ) {
          const varsToAdd = {};
          const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
          const tableInfo = aptugo.store.getState().application.tables.find(table => table.unique_id === element.values.data )
          const tableFields = tableInfo.fields;
          tableFields.forEach(tableField => { varsToAdd[tableField.column_name] = 'String' });
          const finalVarsToAdd = {
            [aptugo.friendly(tableInfo.name).toLowerCase() + 'Data']: {
              loadingStatus: 'String',
              addingStatus: 'String',
              searchingStatus: 'String',
              searchString: 'String',
              totalDocs: 'String',
              [aptugo.friendly(tableInfo.name).toLowerCase()]: { ...varsToAdd },
              ['found' + aptugo.friendly(tableInfo.name).toLowerCase()]: { ...varsToAdd },
              errField: 'String',
              errStatus: 'String',
              errMessage: 'String'
            }
          }
          aptugo.variables.setElementVariable( element.unique_id, finalVarsToAdd)
          aptugo.variables.setPageVariable(page, element.unique_id, finalVarsToAdd)
          if (element.values.variableName) {
            aptugo.variables.setPageVariable(page, element.unique_id + '_2', { [element.values.variableName]: { ...varsToAdd } });
          }
        }
      active: true
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: singleResult
    display: Obtain a single (or first) result
    type: checkbox
  - name: onload
    display: Run code upon loading
    type: function
    options: ''
  - name: searchString
    display: Search String
    type: text
    options: ''
  - name: useExactMatch
    display: Should use an exact match?
    type: checkbox
    options: ''
  - name: customEffect
    display: Customize actions on search?
    type: checkbox
    options: ''
  - name: effectOnSearch
    display: Custom actions on search
    type: function
    options: ''
    settings:
      condition: true
      propertyCondition: customEffect
  - name: fieldToSearch
    display: Field To Search
    type: text
    options: ''
  - name: sortColumn
    display: Sort Column
    type: text
    options: ''
  - name: sortMethod
    display: Sort Method
    type: dropdown
    options: desc;asc
  - name: sortLanguage
    display: Sort Language
    type: dropdown
    options: 
      return [['en', 'English'],['es', 'Spanish']]
  - name: elementsLimit
    display: Limit of Elements
    type: text
    options: ''
    settings:
      default: '25'
  - name: donotpopulate
    display: Do NOT populate related tables
    type: checkbox
    options: ''
  - name: defaultPage
    display: Default page
    type: text
    options: ''
    advanced: true
    settings:
      default: '1'
  - name: loadWhenSiteLoads
    display: Load when Site Loads
    type: checkbox
    advanced: true
    settings:
      default: false
children: []
*/
{% if data %}
  {% set table = data | tableData %}
{% else %}
  {% set table = element.values.data | tableData %}
{% endif %}
{% set innervarname = table.name | friendly %}
{% if element.name != 'loadFromDatabase' %}
  {% set innervarname = element.name | friendly %}
{% endif %}
{% set varName = element.values.variableName|default(table.name | friendly | lower ~ 'Data') %}
{% if element.values.loadWhenSiteLoads %}
  {# Special method to load on page load #}
  {% set goesToIndex %}
    import { load{{ table.name | friendly | capitalize }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
    store.dispatch(load{{ table.name | friendly | capitalize }}({ limit: 500 }))
  {% endset %}
  {{ add_setting('IndexPreAdd', goesToIndex)}}
{% else %}
  {# Standard usage #}
{% set bpr %}
import { load{{ table.name | friendly | capitalize }}, search{{ table.name | friendly | capitalize }} } from '@store/actions/{{ table.name | friendly | lower }}Actions'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { IState } from '@store/reducers/index'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { useDispatch } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
  import { useSelector } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set ph %}
const dispatch = useDispatch()
{% endset %}
{{ save_delayed('ph', ph ) }}
{% if not element.values.singleResult %}
{% set ph %}
const {{ table.name | friendly | lower ~ 'Data' }} = useSelector((state: IState) => state.{{ table.name | friendly | lower }})
{% endset %}
{{ save_delayed('ph', ph, 1 ) }}
{% endif %}
{% if element.values.singleResult %}
{% set bpr %}
import { I{{ table.name | friendly }}Item } from '@store/models'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% endif %}
{% set ph %}
const {{ varName }} = useSelector((state: IState){% if element.values.singleResult %}:I{{ table.name | friendly }}Item{% endif %} => state.{{ table.name | friendly | lower }}){% if element.values.variableName %}.{% if element.values.searchString %}found{% endif %}{{ table.name | friendly | lower }}{% endif %}{% if element.values.singleResult %}[0] || {}{% endif %}
{% endset %}
{{ save_delayed('ph', ph, 1 ) }}
{% set ph %}
const [{{ innervarname }}loadoptions, set{{ innervarname }}loadoptions] = React.useState<any>({ 
  page: {{ element.values.defaultPage | default(1) }},
  populate: {% if element.values.donotpopulate %}false{% else %}true{% endif %},
  {% if element.values.elementsLimit %}limit: {{element.values.elementsLimit}}{% else %}limit: 25{% endif %},
  sort: { field: {{ element.values.sortColumn | default('null') }}, method: '{{ element.values.sortMethod | default('DESC') }}' },
  {% if element.values.fieldToSearch %}
    searchField: {{ element.values.fieldToSearch | textOrVariableInCode }},
  {% endif %}
  totalItems: 0,
  sortLanguage: '{{ element.values.sortLanguage|default('en') }}',
})
const perform{{ innervarname }}load = (options) => {
  {% if element.values.searchString %}
    if (typeof options.searchString !== 'undefined') {
      dispatch(search{{ table.name | friendly | capitalize }}(options))
    }
  {% else %}
    dispatch(options.searchString ? search{{ table.name | friendly | capitalize }}(options) : load{{ table.name | friendly | capitalize }}(options))
  {% endif %}
}
{% endset %}
{{ save_delayed('ph',ph)}}
{% set ph %}
React.useEffect(() => {
{% if element.values.searchString and element.values.customEffect and element.values.effectOnSearch %}
  {{ element.values.effectOnSearch | raw }}
{% else %}
  perform{{ innervarname }}load({
    ...{{ innervarname }}loadoptions
    {% if element.values.fixedSearchField %}, fixedSearch: { field: {{ element.values.fixedSearchField}}, value: {{ element.values.fixedSearchString }} }{% endif %}
    {% if element.values.fieldToSearch %}, searchField: {{ element.values.fieldToSearch | textOrVariableInCode }}{% endif %}
    {% if element.values.searchString %}, searchString: {{ element.values.searchString }}{% endif %}
    {% if element.values.useExactMatch %}, exactMatch: {{ element.values.useExactMatch }}{% endif %}
  })
{% endif %}
},[{{ innervarname }}loadoptions{% if element.values.searchString %}, {{ element.values.searchString }}{% endif %}])
{% endset %}
{{ save_delayed('ph',ph)}}
{% if element.values.onload or element.children %}
{% if element.values.searchString %}
  {% set functionCall = 'searchingStatus' %}
{% else %}
  {% set functionCall = 'loadingStatus' %}
{% endif %}
React.useEffect(() => {
  if ({{ table.name | friendly | lower }}Data.{{ functionCall }} === 'loaded') {
    {{ element.values.onload }}
    {% if element.children %}{{ content | raw }}{% endif %}
  }
}, [{{ table.name | friendly | lower }}Data.{{ functionCall }}])
{% endif %}
{% endif %}