/*
path: model.tpl
type: file
unique_id: Naq5o3C5
icon: ico-field
*/
{% set fieldName = field.column_name | friendly %}
{% set isRequired = field.required | default(false) %}
{% set isUnique = field.unique | default(false) %}
{% set length = field.length | default(null) %}
{% set columnArgs = [] %}
{% set columnArgs = columnArgs|merge(['name = "' ~ fieldName ~ '"']) %}
{% if isRequired %}
    {% set columnArgs = columnArgs|merge(['nullable = false']) %}
{% endif %}
{% if isUnique %}
    {% set columnArgs = columnArgs|merge(['unique = true']) %}
{% endif %}

{% set generatedCode %}
@Column({{ columnArgs|join(', ') }})
private String {{ fieldName }};
{% endset %}

{{ {'rawString': generatedCode | trim} | json_encode() }}