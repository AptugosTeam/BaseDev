/*
path: edit.tpl
type: file
unique_id: XLsE3nbG
icon: ico-field
sourceType: javascript
settings:
  - name: Packages
    value: '"react-select": "^5.4.0",'
children: []
*/
{% set fieldTable = (field | fieldData).table %}
{% if fieldTable.subtype == 'Firebase' %}
  {% include includeTemplate('Fields' ~ field.data_type ~'editFireBase.tpl') %}
{% else %}
  {% set tableName = fieldTable.name | friendly %}
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
  import Autocomplete from '@components/Autocomplete'
  {% endset %}
  {{ save_delayed('bpr',bpr) }}
  {% set ph %}
  const typeInSearch{{ field.column_name | friendly }}{{ referencedTable }} = async (typedIn) => {
    const {{ columnName }}Options = await fetcher('/api/{{ referencedTable | lower }}').then(arc => {
        return arc.{{ referencedTable | lower }}.map(ac => { return { value: ac._id, label: ac.{{ referencedField.column_name | friendly }} }})
      })
      return {{ columnName }}Options
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
    value={ {{ columnName }}Value }
    onType={ typeInSearch{{ field.column_name | friendly }}{{ referencedTable }} }
    onChange={(newValue) => {
      if (!newValue) handle{{ tableName }}Change('{{ columnName }}')(null)
      else handle{{ tableName }}Change('{{ columnName }}')(newValue?.length ? newValue.map(item => ({ _id: item.value !== 'new' ? item.value : null, {{ referencedField.column_name | friendly }}: item.label })) : [])
    }}
    loading={true}
    label="{{ field.column_name }}"
    fullWidth
    variant="{{ element.values.variant|default('standard') }}"
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    add={ {{ field.add|default('true') }} }
    {% if field.displaytype == 'chips' %}chips{% endif %}
  />
{% endif %}