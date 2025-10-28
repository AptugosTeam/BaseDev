/*
path: find.tpl
completePath: elements/Fields/Autocomplete/find.tpl
unique_id: t9Bzg4Oy
*/
{% set referencedField = field.reference | fieldData %}
{% if field.relationshipType == 'm:1' %}
  // m:1 - {{ field.column_name }} {{ inaggregation }}
  {% set preparedLookup %}
    $lookup: {
      from: '{{ referencedField.table.name | friendly }}',
      localField: '{{ field.column_name | friendly }}',
      foreignField: '_id',
      as: '{{ field.column_name | friendly }}'
    }
    },
    { $unwind: { path: '${{ field.column_name | friendly }}', preserveNullAndEmptyArrays: true }
  {% endset %}
{% elseif field.relationshipType == '1:m' %}
  // 1-m: {{field.column_name }}  {{ inaggregation }}
  {% set autocompleteFields = [] %}
  {% for f in referencedField.table.fields %}
    {% if f.data_type == 'Autocomplete' %}
      {% do autocompleteFields.push(f) %}
    {% endif %}
  {% endfor %}
  {% set preparedLookup %}
  $lookup: {
    from: '{{ referencedField.table.name | friendly }}',
    localField: '{{ field.column_name | friendly }}',
    foreignField: '_id',
    as: '{{ field.column_name | friendly }}'
    {% if inaggregation == false and autocompleteFields|length > 0 %},
      pipeline: [
        {% for subfield in autocompleteFields %}
          {% include includeTemplate(['FieldsAutocompletefind.tpl']) with { 'field': subfield, inaggregation: true } %}
        {% endfor %}
      ]
    {% endif %}
  }
  {% endset %}
{% endif %}
{% if inaggregation %}
  { {{ preparedLookup }} },
{% else %}
  aggregate.push({
    {{ preparedLookup }}
  })
  {% set inaggregation = true %}
{% endif %}