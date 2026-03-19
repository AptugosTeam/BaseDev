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
  {% set tableName = fieldTable.name | friendly %}
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
    const searchOptions = {
      searchField: 'name',
      searchString: typedIn
    }

    const {{ columnName }}Options = await fetcher('/api/{{ referencedTable | lower }}/search?' + new URLSearchParams(searchOptions).toString() ).then(arc => {
        return arc.{{ referencedTable | lower }}.map(ac => { return { value: ac._id, title: ac.{{ referencedField.column_name | friendly | lower }} }})
      })
      return {{ columnName }}Options
  }
  {% endset %}
  {{ save_delayed('ph',ph) }}
  <Autocomplete
    value={ { value: {{ tableName }}data.{{ columnName | lower }}?._id || '', title: {{ tableName }}data.{{ columnName | lower }}?.name }}
    onType={ typeInSearch{{ field.column_name | friendly }}{{ referencedTable }} }
    onChange={(newValue) => {
      if (!newValue) handle{{ tableName }}Change('{{ columnName }}')(null)
      else handle{{ tableName }}Change('{{ columnName | lower }}')({ _id: newValue.value !== 'new' ? newValue.value : null, name: newValue.title })
    }}
    loading={true}
    label="{{ field.column_name }}"
    fullWidth
    variant="{{ element.values.variant|default('standard') }}"
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    add={ {{ field.add|default('true') }} }
  />
{% endif %}