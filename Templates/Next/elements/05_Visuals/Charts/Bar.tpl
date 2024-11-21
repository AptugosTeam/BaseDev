/*
path: Bar.tpl
completePath: elements/Experimental/Charts/Bar.tpl
type: file
unique_id: 5ahjlw3b
icon: ico-bar-chart
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
  - name: barSize
    display: Bar Size
    type: text
  - name: colors
    display: Fill Color
    type: text
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
    <Bar 
      dataKey="{% if values.column_name %}{{ values.column_name }}{% else %}{{ element.values.valuesVariable }}{% endif %}" 
      legendType="{{element.values.legendType|default('line')}}" 
      barSize={ {{element.values.barSize|default(20)}} } 
      fill="#{{element.values.colors|default('000')}}" 
    />