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
  {% include includeTemplate('Fields' ~ field.data_type ~'editFireBase.tpl') %}
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
  {% set bpr %}
  import Autocomplete from '@components/Autocomplete'
  {% endset %}
  {{ save_delayed('bpr',bpr) }}
  <Autocomplete
    value={ {{ tableName }}data.{{ field.column_name | friendly }} || '' }
    onChange={(newValue) => {
      {% if field.relationshipType == '1:m' %}
        if (!newValue || !newValue.length) handle{{ tableName }}Change('{{ columnName }}')([])
      {% else %}
        if (!newValue) handle{{ tableName }}Change('{{ columnName }}')(null)
      {% endif %}
      else handle{{ tableName }}Change('{{ columnName }}')(newValue)
    }}
    endpointLocation='/api/{{ referencedTable | lower }}/search'
    label="{{ field.column_name }}"
    fullWidth
    variant="{{ element.values.variant|default('standard') }}"
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    add={ {{ field.add|default('true') }} }
    {% if field.relationshipType == '1:m' %}chips{% endif %}
    labelProperty='{{ referencedField.column_name | friendly }}'
  />
{% endif %}