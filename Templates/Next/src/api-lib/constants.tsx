/*
path: constants.tsx
keyPath: src/api-lib/constants.tsx
unique_id: Z8DPkRtB
*/

export const ValidateProps = {
  {% for table in application.tables %}
  {{ table.singleName | friendly | lower }}: {
    {% for field in table.fields %}
      {% set type = field.data_type | lower %}
      {% set fieldWithData = field|fieldData %}
      {% if fieldWithData.data_type == 'Autocomplete' %}{% set type = "string" %}
      {% elseif fieldWithData.options.frontEndType %}{% set type = fieldWithData.options.frontEndType %}
      {% elseif fieldWithData.extraOptions.frontEndType %}{% set type = fieldWithData.extraOptions.frontEndType %}
      {% endif %}
      {{ field.column_name | friendly }}: { type: "{{ type }}" },
    {% endfor %}
  },
  {% endfor %}
}
