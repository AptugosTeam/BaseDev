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
  - name: legendType
    display: Legend Type
    type: dropdown
    options: line;plainline;square;rect;circle;cross;diamond;star;triangle;wye;none
  - name: colors
    display: Fill Color
    type: text
  - name: opacity
    display: Opacity
    type: dropdown
    options: 0.0;0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
  {% set ph %}
    {% set valuesName = element.values.valuesVariable %}
    {% set name = element.values.valuesVariable %}
  {% if element.values.values != 'useVar' %}
    {% set values = element.values.values|fieldData %}
    {% set valuesName = values.column_name %}
  {% endif %}
  {% endset %}
  {{ save_delayed('ph',ph) }}
    <Area 
      type="monotone" 
      legendType="{{ element.values.legendType|default('line') }}" 
      dataKey="{% if values.column_name %}{{ values.column_name }}{% else %}{{ element.values.valuesVariable }}{% endif %}" 
      stroke="{{ element.values.colors }}" 
      fillOpacity={ {{ element.values.opacity|default(1) }} } 
      fill="#{{ element.values.colors }}" 
    />