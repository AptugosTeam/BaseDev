/*
path: editFireBase.tpl
type: file
unique_id: XLsE4nbG
icon: ico-field
sourceType: javascript
settings:
  - name: Packages
    value: '"react-select": "^5.4.0",'
children: []
*/
{% set bpr %}
import { useSelector } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set referencedField = field.reference | fieldData %}
{% if field.referencekey %}
  {% set referencekey = (field.referencekey | fieldData).column_name %}
{% else %}
  {% set referencekey = '_id' %}
{% endif %}
{% set referencedTable = referencedField.table.name | friendly | capitalize %}
{% set columnName = field.column_name | friendly %}
{% set odc %}
set{{ columnName }}Value(null)
{% endset %}
{{ add_setting('OnDialogClose', odc) }}
{% set bpr %}
import { search{{ referencedTable }} } from '@store/actions/{{ referencedTable | lower }}Actions'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import Autocomplete from '@components/Autocomplete'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const {{ referencedTable | lower }}AutocompleteData = useSelector((state: IState) => state.{{ referencedTable | lower }})
{% endset %}
{{ save_delayed('ph',ph) }}
{% set ph %}
const [{{ columnName }}Options, set{{ columnName }}Options] = React.useState<{ label: String, value: String }[]>([])
const typeInSearch{{ field.column_name | friendly }}{{ referencedTable }} = (typedIn) => {
  const searchOptions = { 
    searchString: typedIn, 
    searchField: '{{ referencedField.column_name | friendly }}', 
    page: 1, 
    limit: {{ element.values.limit|default(25) }},
    {% if element.values.sortMethod %}
    sort: { field: '{{ referencedField.column_name | friendly }}', method: '{{ element.values.sortMethod | default('desc') }}' },
    {% endif %}
    sortLanguage: '{{ element.values.sortLanguage|default('en') }}',
  }
  axios.get('{{ settings.apiURL }}/api/{{ referencedTable | lower }}/search/', { params: searchOptions }).then(result => { 
    set{{ columnName }}Options(result.data.docs.map({{ referencedField.table.singleName | friendly | lower }} => {
      return {
        label: {{ referencedField.table.singleName | friendly | lower }}.{{ referencedField.column_name | friendly }},
        value: {{ referencedField.table.singleName | friendly | lower }}.{{ referencekey }}
      }
    }))
  })
}
{% endset %}
{{ save_delayed('ph',ph) }}
{% set ph %}
const [{{ columnName }}Value, set{{ columnName }}Value] = React.useState(null)
React.useEffect(() => {
    if (!{{ tableName }}data.{{ columnName }}) return undefined
    set{{ columnName }}Value({{ tableName }}data.{{ columnName }})
  }, [{{ tableName }}data.{{ columnName }}])

{% endset %}
{{ save_delayed('ph',ph) }}
<Autocomplete
  {% if field.displaytype == 'chips' %}chips{% endif %}
  value={ {{ columnName }}Value }
  {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
  onType={ typeInSearch{{ field.column_name | friendly }}{{ referencedTable }} }
  onChange={(newValue) => {
    handle{{ tableName }}Change('{{ columnName }}')(newValue[0].value)
  }}
  loading={ {{ referencedTable | lower }}AutocompleteData.loadingStatus === 'loading' }
  {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
  options={ {{ columnName }}Options }
  label="{{ field.column_name }}"
  fullWidth
  variant="{{ element.values.variant|default('standard') }}"
  margin='{{ element.values.margin|default("dense") }}'
  size='{{ element.values.size|default("medium") }}'
  add={ {{ field.add|default('true') }} }
/>
