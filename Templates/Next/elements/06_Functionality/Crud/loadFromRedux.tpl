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
  - name: tableOrData
    display: Data
    type: dropdown
    options: >-
      return aptugo.store.getState().application.tables.map(({ unique_id, name
      }) => [unique_id, name])
    settings:
      aptugoOnChange: |-
        const tableInfo = aptugo.tableUtils.getTable(value);
        const fields = aptugo.tableUtils.getAllFields(value).reduce((acc, field) => {
          acc[field.column_name] = 'String'; 
          return acc;
        }, {});
        aptugo.variables.setPageVariable(page, element.unique_id, { [tableInfo.name]: fields });
      aptugoOnLoad: |-
        const element = arguments[0];
        if ( element.values.tableOrData ) {
          const varsToAdd = {};
          const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
          const tableInfo = aptugo.store.getState().application.tables.find(table => table.unique_id === element.values.tableOrData )
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
  {% if element.values.tableOrData is not empty %}
    {% set table = element.values.tableOrData | tableData %}
  {% elseif element.values.data is not empty %}
    {% set table = element.values.data | tableData %}
  {% endif %}
{% endif %}

{% set tableName = table.name | friendly | lower %}
{% set singleName = table.singleName | friendly | lower %}
{% set innervarname = table.name | friendly %}
{% if element.name != 'loadFromDatabase' %}{% set innervarname = element.name | friendly %}{% endif %}
{% set varName = element.values.variableName %}
{% if element.values.loadWhenSiteLoads %}
  {# Special method to load on page load #}
  {% set goesToIndex %}
    import { load{{ table.name | friendly | capitalize }} } from './store/actions/{{ table.name | friendly | lower }}Actions'
    store.dispatch(load{{ table.name | friendly | capitalize }}({ limit: 500 }))
  {% endset %}
  {{ add_setting('IndexPreAdd', goesToIndex)}}
{% else %}
  {# Standard usage #}
  {% set bpr %}
    import { use{{ tableName }}Pages } from "@lib/{{ tableName }}";
  {% endset %}
  {{ save_delayed('bpr', bpr)}}
  {% set ph %}
    const [{{ innervarname }}loadoptions, set{{ innervarname }}loadoptions] = React.useState<any>({ 
      page: {{ element.values.defaultPage | default(1) }},
      populate: {% if element.values.donotpopulate %}false{% else %}true{% endif %},
      {% if element.values.elementsLimit %}limit: {{element.values.elementsLimit}}{% else %}limit: 25{% endif %},
      {% if element.values.sortColumn %}sortField: '{{element.values.sortColumn}}',{% endif %}
      {% if element.values.sortMethod %}sortMethod: '{{element.values.sortMethod}}',{% endif %}
      {% if element.values.fieldToSearch %}
        searchField: {{ element.values.fieldToSearch | textOrVariableInCode }},
      {% endif %}
      {% if element.values.searchString %}
        filter: JSON.stringify({ {{ element.values.fieldToSearch | textOrVariableInCode }}: {{ element.values.searchString }} }),
      {% endif %}
      totalItems: 0,
      sortLanguage: '{{ element.values.sortLanguage|default('en') }}',
      isReady: {% if element.values.searchString %}!!{{ element.values.searchString }}{% else %}true{% endif %}
    })

    const { {{ singleName }}data{% if varName %}: {{ varName }}{% endif %}, {{ singleName }}isLoading, {{ singleName }}isError, {{ singleName }}pages } = use{{ tableName }}Pages({{ innervarname }}loadoptions)
  {% endset %}
  {{ save_delayed('ph', ph)}}
  {% if element.values.onload or element.children %}
    {% if element.values.searchString %}
      {% set functionCall = 'searchingStatus' %}
    {% else %}
      {% set functionCall = 'loadingStatus' %}
    {% endif %}
React.useEffect(() => {
  if ({{ varName }}) {
    {{ element.values.onload }}
    {% if element.children %}{{ content | raw }}{% endif %}
  }
}, [{{ varName }}])
  {% endif %}
{% endif %}