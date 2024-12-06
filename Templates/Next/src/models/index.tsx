/*
path: index.tsx
completePath: /Users/Shared/Dev/BaseDev/Templates/Next/src/models/index.tsx
keyPath: src/models/index.tsx
unique_id: R10oLubF
*/
{% for table in application.tables %}
  {% set tableName = table.name | friendly %} 
  import {{ tableName }}Model from './{{ tableName }}'
{% endfor %}


export { 
  {% for table in application.tables %}
    {% set tableName = table.name | friendly %} 
    {{ tableName }}Model,
  {% endfor %}
}