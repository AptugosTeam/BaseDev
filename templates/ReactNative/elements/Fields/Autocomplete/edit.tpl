/*
path: edit.tpl
type: file
unique_id: XLsE3nbG
icon: ico-field
sourceType: javascript
settings:
  - name: Packages
    value: '"react-select": "^4.2.1",'
children: []
*/
{% set bpr %}
import { useSelector } from 'react-redux'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set referencedField = field.reference | fieldData %}
{% set referencekey = '_id' %}

{% set referencedTable = referencedField.table.name | friendly | capitalize %}
{% set columnName = field.column_name | friendly %}
{% set bpr %}
import { search{{ referencedTable }} } from '../store/actions/{{ referencedTable | lower }}Actions'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set bpr %}
import Autocomplete from '../components/Autocomplete'
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
  const searchOptions = { searchString: typedIn, searchField: '{{ referencedField.column_name | friendly }}', page: 1, limit: 10 }
  axios.get('{{ settings.apiURL }}/api/{{ referencedTable | lower }}/search/', { params: searchOptions }).then(result => { 
    set{{ columnName }}Options(result.data.docs.map({{ referencedField.table.singleName | friendly | lower }} => { return { label: {{ referencedField.table.singleName | friendly | lower }}.{{ referencedField.column_name | friendly }}, value: {{ referencedField.table.singleName | friendly | lower }}.{{ referencekey }} }}))
  })
}
{% endset %}
{{ save_delayed('ph',ph) }}
{% set ph %}
const [{{ columnName }}Value, set{{ columnName }}Value] = React.useState(null)
React.useEffect(() => {
    if (!{{ tableName }}data.{{ columnName }}) return undefined
    const asArray = Array.isArray({{ tableName }}data.{{ columnName }}) ? {{ tableName }}data.{{ columnName }} : [{{ tableName }}data.{{ columnName }}]
    set{{ columnName }}Value(
      asArray.map(item => ({ label: item.{{ referencedField.column_name | friendly }}, value: item._id }))
    )
  }, [{{ tableName }}data.{{ columnName }}])

{% endset %}
{{ save_delayed('ph',ph) }}
<Autocomplete
  {% if field.displaytype == 'chips' %}chips{% endif %}
  value={ {{ columnName }}Value }
  onType={ typeInSearch{{ field.column_name | friendly }}{{ referencedTable }} }
  onChange={(newValue) => handle{{ tableName }}Change('{{ columnName }}')(newValue?.length ? newValue.map(item => ({ _id: item.value !== 'new' ? item.value : null, {{ referencedField.column_name | friendly }}: item.label })) : [])}
  loading={ {{ referencedTable | lower }}AutocompleteData.loadingStatus === 'loading' }
  {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
  options={ {{ columnName }}Options }
  label="{{ field.column_name }}"
  fullWidth
  variant="{{ element.values.variant|default('standard') }}"
  margin='{{ element.values.margin|default("dense") }}'
/>
