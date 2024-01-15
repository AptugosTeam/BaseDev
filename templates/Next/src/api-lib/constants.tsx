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
      {{ field.column_name | friendly | lower }}: { type: "{{ field.data_type | lower }}" },
    {% endfor %}
  },
  {% endfor %}
}
