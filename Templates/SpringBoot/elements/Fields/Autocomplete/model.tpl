/*
path: model.tpl
type: file
unique_id: 9TTs5aut
icon: ico-field
*/
{% set fieldInfo = field | fieldData %}
{% set annotations = [] %}
{% set relatedEntityClass = (field.reference | fieldData).table.singleName | friendly %}
{% set currentEntityFieldName = field.column_name | friendly %}
{% set columnType = relatedEntityClass %}

{% if field.relationshipType == '1:1' %}
    {% set annotations = annotations|merge(['@OneToOne(fetch = FetchType.LAZY' ~ (not field.required ? ', optional = true' : ', optional = false') ~ ')']) %}
    {% if fieldInfo.owner %}
        {% set annotations = annotations|merge(['@JoinColumn(name = "' ~ currentEntityFieldName ~ '_id"' ~ (field.unique ? ', unique = true' : '') ~ (not field.required ? ', nullable = true' : ', nullable = false') ~ ')']) %}
    {% else %}
        {% set inverseFieldName = fieldInfo.inverseFieldName | friendly | default('VERIFICAR_INVERSE_FIELD') %}
        {% set annotations = annotations|merge(['@OneToOne(mappedBy = "' ~ inverseFieldName ~ '")']) %}
    {% endif %}
{% elseif field.relationshipType == 'm:1' %}
    {% set annotations = annotations|merge(['@ManyToOne(fetch = FetchType.LAZY' ~ (not field.required ? ', optional = true' : ', optional = false') ~ ')']) %}
    {% set annotations = annotations|merge(['@JoinColumn(name = "' ~ currentEntityFieldName ~ '_id"' ~ (not field.required ? ', nullable = true' : ', nullable = false') ~ ')']) %}
    {% set annotations = annotations|merge(['@ToString.Exclude', '@EqualsAndHashCode.Exclude']) %}
{% elseif field.relationshipType == '1:m' %}
    {% set inverseFieldName = fieldInfo.inverseFieldName | friendly | default('VERIFICAR_INVERSE_FIELD') %}
    {% set annotations = annotations|merge(['@OneToMany(mappedBy = "' ~ inverseFieldName ~ '", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)']) %}
    {% set annotations = annotations|merge(['@ToString.Exclude', '@EqualsAndHashCode.Exclude']) %}
    {% set columnType = 'Set<' ~ relatedEntityClass ~ '>' %}
{% elseif field.relationshipType == 'm:n' %}
     {% set annotations = annotations|merge(['@ManyToMany(fetch = FetchType.LAZY)']) %}
     {% set currentTableName = table.name | friendly | lower %}
     {% set relatedTableName = (field.reference | fieldData).table.name | friendly | lower %}
     {% set joinTable = fieldInfo.join_table | default(currentTableName ~ '_' ~ relatedTableName) %}
     {% set joinColumnName = fieldInfo.join_column | default(currentTableName ~ '_id') %}
     {% set inverseJoinColumnName = fieldInfo.inverse_join_column | default(relatedTableName ~ '_id') %}
     {% set annotations = annotations|merge(['@JoinTable(name = "' ~ joinTable ~ '", joinColumns = @JoinColumn(name = "' ~ joinColumnName ~ '"), inverseJoinColumns = @JoinColumn(name = "' ~ inverseJoinColumnName ~ '"))']) %}
     {% set annotations = annotations|merge(['@ToString.Exclude', '@EqualsAndHashCode.Exclude']) %}
     {% set columnType = 'Set<' ~ relatedEntityClass ~ '>' %}
{% endif %}

{% set generatedCode %}
{% for annotation in annotations %}
    {{- annotation }}
{% endfor %}
private {{ columnType }} {{ currentEntityFieldName }};
{% endset %}

{% set output_data = {
    'rawString': generatedCode | trim
} %}
{{ output_data | json_encode() }}