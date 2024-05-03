/*
path: index.tsx
keyPath: src/api-lib/db/index.tsx
unique_id: bNc9JASZ
*/
{% for table in application.tables %}
  export * from './{{ table.name | friendly | lower }}'
{% endfor %}
{{ insert_setting('addedModel') | raw }}