/*
path: Area.tpl
type: file
unique_id: ajkld33b
icon: ico-google-analytics
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
  - name: id
    display: Color ID
    type: text
  - name: legendType
    display: legendType
    type: dropdown
    options: line;plainline;square;rect;circle;cross;diamond;star;triangle;wye;none
  - name: colors
    display: AreaOneColor Scheme
    type: dropdown
    options: >-
      Green;Red;Blue;Black;Cyan
  - name: opacity
    display: opacity
    type: dropdown
    options: 0.0;0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1
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
    <defs>
    <linearGradient id="{{ element.values.id }}" x1="0" y1="0" x2="0" y2="1">
      <stop offset="100%" stopColor="{{ element.values.colors }}" stopOpacity={ {{ element.values.opacity }} }/>
    </linearGradient>
    </defs>
    <Area type="monotone" legendType="{{ element.values.legendType|default('line') }}" dataKey="{% if values.column_name %}{{ values.column_name }}{% else %}{{ element.values.valuesVariable }}{% endif %}" stroke="#8884d8" fillOpacity={1} fill="url(#{{ element.values.id }})" />