/*
path: Line.tpl
type: file
unique_id: 5l46533b
icon: ico-google-analytics
helpText: Generate HTML pages after build
options:
  - name: values
    display: Values YAxis
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: valuesVariable
    display: Values Variable
    type: text
    settings:
      propertyCondition: values
      condition: useVar
      active: true
  - name: colors
    display: LineOneColor Scheme
    type: dropdown
    options: >-
      Green;Red;Blue;Black;Cyan
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
    {% set ph %}
    {% set name = element.values.valuesVariable %}
      {% set values = element.values.values|fieldData %}
      {% set valuesName = values.column_name %}
      {% set indexBy = element.values.Index|fieldData %}
      {% set indexName = indexBy.column_name %}
    {% endset %}
    {{ save_delayed('ph',ph) }}
    <Line type="monotone" dataKey="{% if values.column_name %}{{ values.column_name }}{% else %}{{ element.values.valuesVariable }}{% endif %}" stroke="{{element.values.colors|default('Black')}}" />