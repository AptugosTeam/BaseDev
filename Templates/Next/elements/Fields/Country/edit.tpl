/*
path: edit.tpl
type: file
unique_id: VikMgBcd
icon: ico-field
extraFiles:
  - source: 'elements/99_ExtraFiles/069_CountrySelector.tsx'
    destination: '/src/components/CountrySelector/index.tsx'
*/
{% set bpr %}
import CountrySelector from '@components/CountrySelector'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set tableName = ( field | fieldData ).table.name | friendly %}
{% set fieldValue = tableName ~ 'data.' ~ field.column_name | friendly %}
{% if element.values.alternativeValue %}
  {% set fieldValue = element.values.alternativeValue %}
{% endif %}
{% set saveValue = 'handle' ~ tableName ~ 'Change("' ~ field.column_name | friendly ~ '")' %}
{% if element.values.alternativeSaveMethod %}
  {% set saveValue = element.values.alternativeSaveMethod | functionOrCall %}
{% endif %}
<CountrySelector
  {% if element.values.classname %}className={ {{ element.values.classname }} }{% endif %}
  label={{ field.prompt|default(field.column_name) | textOrVariable }}
  {% if field.placeholder %}placeholder={{ field.placeholder | textOrVariable }}{% endif %}
  value={ {{ fieldValue }} }
  onChange={ {{ saveValue }}}
  variant="{{ element.values.variant|default('standard') }}"
  accept="{{ field.filetype|default('*') }}"
  margin='{{ element.values.margin|default("dense") }}'
/>

