/*
path: find.tpl
completePath: elements/Fields/Autocomplete/find.tpl
unique_id: t9Bzg4Oy
*/
{% set currentFieldData = field | fieldData %}
{% set reference = field.reference | fieldData %}
{% if reference.table.subtype == 'Aptugo' %}
  {% set population = false %}
  {% set subpopulation = [] %}
  {% for everyField in builder.plainFields %}
    {% if everyField.reference %}
      {% set everyFieldRelationshipData = everyField.reference | fieldData %}
      {% set everyFieldData = everyField | fieldData %}
      {% if reference.table.unique_id == everyFieldData.table.unique_id %}
        {% set subpopulation = subpopulation|merge(["{ strictPopulate: false, model: '" ~ everyFieldRelationshipData.table.name | friendly ~ "', path: '" ~ everyField.column_name | friendly ~ "' }"]) %}
        {% set population = true %}
      {% endif %}
      {% if reference.table.unique_id == everyFieldRelationshipData.table.unique_id and everyFieldData.table.unique_id != currentFieldData.table.unique_id %}
        {% set subpopulation = subpopulation|merge(["{ strictPopulate: false, model: '" ~ everyFieldData.table.name | friendly ~ "', path: '" ~ everyFieldData.table.name | friendly ~ "' }"]) %}
        {% set population = true %}
      {% endif %}
    {% endif %}
  {% endfor %}
  .populate((query.populate === 'true' || query.populate?.indexOf('{{ reference.table.name | friendly }}') > -1) && { 
    strictPopulate: false,
    model: '{{ reference.table.name | friendly }}',
    path: '{{ field.column_name }}'
    {% if population %}
    , populate: [
      {% for sub in subpopulation %}
        {{ sub }},
      {% endfor %}
    ]
    {% endif %}
  })
{% endif %}