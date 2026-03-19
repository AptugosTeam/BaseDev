/*
path: Pie.tpl
completePath: elements/Experimental/Charts/Pie.tpl
type: file
unique_id: ajkld33t
icon: ico-pie-chart
options:
  - name: responsive
    display: Responsive?
    type: checkbox
    options: ''
  - name: Variable
    display: Variable to Use
    type: text
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
  - name: tooltip
    type: text
  - name: nameKey
    type: text
    advanced: true
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
{% set bpr %}
import { PieChart, Pie, Sector, Cell, Tooltip, ResponsiveContainer } from 'recharts'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const colors{{ element._unique_id }} = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042']
{% endset %}
{{ save_delayed('ph',ph)}}
{% if element.values.values != 'useVar' %}
  {% set values = element.values.values|fieldData %}
{% endif %}
{% if element.values.responsive %}<ResponsiveContainer>{% endif %}
<PieChart>
      <Pie
        data={ {{ element.values.Variable }} }
        cx="50%"
        cy="50%"
        labelLine={false}
        innerRadius={60}
        outerRadius={80}
        {% if element.values.nameKey %}nameKey="{{ element.values.nameKey }}"{% endif %}
        dataKey="{% if values.column_name %}{{ values.column_name }}{% else %}{{ element.values.valuesVariable }}{% endif %}" 
      >
        { {{ element.values.Variable }}.map((entry, index) => (
          <Cell key={`cell-${index}`} fill={colors{{ element._unique_id }}[index % colors{{ element._unique_id }}.length]} />
        ))}
      </Pie>
      <Tooltip {% if element.values.tooltip %}content={({payload}) => {{ element.values.tooltip }} }{% endif %} />
</PieChart>
{% if element.values.responsive %}</ResponsiveContainer>{% endif %}