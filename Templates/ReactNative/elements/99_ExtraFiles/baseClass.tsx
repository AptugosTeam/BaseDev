/*
path: baseClass.tsx
keyPath: elements/Programming/baseClass.tsx
unique_id: classspqWQO2m
internalUse: true
*/
{% for delay in delayed %}
  {% for specificDelay in delay.bpr %}
    {{ specificDelay }}
  {% endfor %}
{% endfor %}

{% if not element.values.returnInstance %}export default {% endif %}class {{ element.values.name }} {% if element.values.extends %}extends {{ element.values.extends }}{% endif %} {
  {% for delay in delayed %}
    {% for specificDelay in delay.variableDeclarations %}
      {{ specificDelay }}
    {% endfor %}
  {% endfor %}
  {{ content | raw }}
}
{% if element.values.returnInstance %}
const classInstance = new {{ element.values.name }}()
export default classInstance
{% endif %}
