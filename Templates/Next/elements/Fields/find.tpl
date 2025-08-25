/*
path: find.tpl
unique_id: generalfind
*/
{% set population = false %}
{% set foundFieldData = [] %}
{% for singleField in builder.plainFields %}
  {% if singleField.reference %}
    {% set relData = singleField.reference | fieldData %}
    {% if (table.unique_id == relData.table.unique_id) and (relData.unique_id == field.unique_id) %}
      {% set foundFieldData = foundFieldData|merge([singleField | fieldData]) %}
      {% set population = true %}
    {% endif %}
  {% endif %}
{% endfor %}
{% if population %}
  {% for ffd in foundFieldData %}
    {% set subpopulation = [] %}
    {% for subpopulationField in ffd.table.fields %}
      {% if subpopulationField.reference %}
        {% set subrelData = subpopulationField.reference | fieldData %}
        {% if (table.unique_id != subrelData.table.unique_id) %}
          {% set subpopulation = subpopulation|merge(["{ model: '" ~ subrelData.table.name | friendly ~ "', path: '" ~ subpopulationField.column_name | friendly ~ "', strictPopulate: false  }"]) %}
        {% endif %}
      {% else %}
        {% for relatedField in builder.plainFields %}
          {% if relatedField.reference and subpopulationField.unique_id == relatedField.reference %}
            {% set subrelData = relatedField | fieldData %}
            {% set subpopulation = subpopulation|merge(["{ model: '" ~ subrelData.table.name | friendly ~ "', path: '" ~ subrelData.table.name | friendly ~ "', strictPopulate: false  }"]) %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endfor %}
    // sub
    {% if ffd.table.name %}
      aggregate.push({ $lookup: {
        from: '{{ ffd.table.name | friendly }}',
        localField: '_id',
        foreignField: '{{ ffd.column_name }}',
        as: '{{ ffd.table.name | friendly }}',
        {% if subpopulation %}
        {% endif %}
      }})
    {% endif %}
  {% endfor %}
{% endif %}
