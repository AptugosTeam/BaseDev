/*
path: models.tsx
completePath: front-end/store/models.tsx
unique_id: K34wWnGp
*/
import { DocumentProvider } from "mongoose"

{% for table in application.tables %}
export interface I{{ table.name | friendly | capitalize }}Item {
  _id?: String
  createdAt: Date
  {% for field in table.fields %}
    {% set fieldInfo = field | fieldData %}
    {% if fieldInfo.options.frontEndType %}
    
      {% set datatype = fieldInfo.options.frontEndType %}
    {% else %}
      {% set datatype = fieldInfo.dataType %}
    {% endif %}
    {% if field.reference %}
      {% set fieldInfoRef = field.reference | fieldData %}
      {% if fieldInfoRef.table.subtype == 'Aptugo' %}
        {{ field.column_name | friendly }}: I{{ fieldInfoRef.table.name | friendly | capitalize }}Item
      {% else %}
      
        {{ field.column_name | friendly }}: {{ fieldInfoRef.dataType }}
      {% endif %}
    {% else %}
      {{ field.column_name | friendly }}: {{ datatype }}
    {% endif %}
  {% endfor %}
  {% for everyField in builder.plainFields %}
    {% if everyField.reference %}
      {% set everyFieldRelationshipData = everyField.reference | fieldData %}
      {% set everyFieldData = everyField | fieldData %}
      {% if (table.unique_id ==  everyFieldRelationshipData.table.unique_id) and (everyFieldData.table.name) %}
        // {{ table.name }} - {{ everyFieldData.table.name }} - {{ everyFieldData.column_name }} - {{ everyFieldRelationshipData.table.name }} - {{ everyFieldRelationshipData.column_name }}
        {{ everyFieldData.table.name }}: I{{ everyFieldData.table.name | friendly | capitalize }}Item[]
      {% endif %}
    {% endif %}
  {% endfor %}
}

export interface Ipaginated{{ table.name | friendly | capitalize }} {
  docs: I{{ table.name | friendly | capitalize }}Item[]
  totalDocs: number
  offset: number
  limit: number
  totalPages: number
  page: number
  pagingCounter: number
  hasPrevPage: boolean
  hasNextPage: boolean
  prevPage: number | null
  nextPage: number | null
}
{% endfor %}

export enum ApiStatus {
  NOTLOADED = 'notloaded',
  LOADING = 'loading',
  LOADED = 'loaded',
  FAILED = 'failed'
}
