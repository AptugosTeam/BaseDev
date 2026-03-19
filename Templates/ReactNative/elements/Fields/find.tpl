/*
path: find.tpl
completePath: elements/Fields/find.tpl
unique_id: SBHiymdS
*/
{% set population = false %}
{% set foundFieldData = [] %}
{% for relatedField in builder.plainFields %}
    {% if relatedField.reference %}
        {% set relData = relatedField.reference | fieldData %}
        {# Relates fields from this table containing relationships with other tables #}
        {% if (table.unique_id == relData.table.unique_id) and (relData.unique_id == field.unique_id) %}
            {% set foundFieldData = foundFieldData|merge([relatedField | fieldData]) %}
            {% set population = true %}
        {% endif %}
    {% endif %}
{% endfor %}
{% if population %}
{% for ffd in foundFieldData %}
{% set subpopulation = [] %}
{% for subpopulationField in ffd.table.fields %}
    {% if subpopulationField.reference %}
        {% set subrelData = subpopulationField.reference | fieldData %}
        {% if (table.unique_id != subrelData.table.unique_id) %}
            {% set subpopulation = subpopulation|merge(["{ model: '" ~ subrelData.table.name | friendly ~ "', path: '" ~ subpopulationField.column_name | friendly ~ "' }"]) %}
        {% endif %}
    {% else %}
        {% for relatedField in builder.plainFields %}
            {% if relatedField.reference and subpopulationField.unique_id == relatedField.reference %}
                {% set subrelData = relatedField | fieldData %}
                {% set subpopulation = subpopulation|merge(["{ model: '" ~ subrelData.table.name | friendly ~ "', path: '" ~ subrelData.table.name | friendly ~ "' }"]) %}
            {% endif %}
        {% endfor %}
    {% endif %}
{% endfor %}
.populate((query.populate === 'true' || query.populate?.indexOf('{{ ffd.table.name | friendly }}') > -1) && {
    strictPopulate: false,
    path: '{{ ffd.table.name | friendly }}'
    {% if subpopulation %}
        , populate: [
        {% for sub in subpopulation %}
            {{ sub }},
        {% endfor %}
        ]
    {% endif %}
})
{% endfor %}
{% endif %}
