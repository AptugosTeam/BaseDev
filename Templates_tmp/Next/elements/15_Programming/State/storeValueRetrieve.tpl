/*
path: storeValueRetrieve.tpl
type: file
unique_id: storevalueretrieve
icon: ico-field
helpText: Retrieves a stored value
options:
  - name: variableName
    display: Name
    type: text
    options: ''
  - name: valueToVar
    display: Store Directly In Variable
    type: text
  - name: onLoad
    display: Store In State
    type: text
    options: ''
  - name: makeItBoolean
    display: Boolean?
    type: checkbox
    options: ''
  - name: default
    display: Default Value
    type: text
    options: ''
  - name: Parse
    display: Parse as JSON?
    type: checkbox
children: []
*/
{% set bprMax %}
"use client";
{% endset %}
{{ save_delayed('bprMax',bprMax,1)}}
{% if element.values.valueToVar %}
  const {{ element.values.valueToVar }} = {% if element.values.Parse %}JSON.parse({% endif %}localStorage?.getItem('{{ element.values.variableName }}'){% if element.values.Parse %}){% endif %}
{% else %}
  {{ element.values.onLoad }}(
    {% if element.values.makeItBoolean %}Boolean({% endif %}
    {% if element.values.Parse %}JSON.parse({% endif %}localStorage?.getItem('{{ element.values.variableName }}'){% if element.values.Parse %}){% endif %} {% if element.values.default %}|| {{ element.values.default | textOrVariableInCode }}{% endif %}
    {% if element.values.makeItBoolean %}){% endif %}
  )
{% endif %}