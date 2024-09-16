/*
path: constants.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/Next/src/api-lib/constants.tsx
keyPath: src/api-lib/constants.tsx
unique_id: Z8DPkRtB
*/
import { nanoid } from "nanoid";

export const ValidateProps = {
  {% for table in application.tables %}
  {{ table.singleName | friendly | lower }}: {
    {% for field in table.fields %}
      {% set type = field.data_type | lower %}
      {% set fieldWithData = field|fieldData %}
      {% if fieldWithData.data_type == 'Autocomplete' %}{% set type = "string" %}
      {% elseif fieldWithData.options.frontEndType %}{% set type = fieldWithData.options.frontEndType %}
      {% elseif fieldWithData.extraOptions.frontEndType %}{% set type = fieldWithData.extraOptions.frontEndType %}
      {% endif %}
      {% if fieldWithData.data_type == 'Datetime' %}{% set type = "string" %}{% set format = "date-time" %}{% endif %}
      {% if fieldWithData.data_type == 'Date' %}{% set type = "string" %}{% set format = "date" %}{% endif %}
      {{ field.column_name | friendly | lower }}: { type: "{{ type }}" {% if format %},format: "{{ format }}" {% endif %} },
    {% endfor %}
  },
  {% endfor %}
}
