/*
path: LineChart.tpl
completePath: elements/Experimental/Charts/LineChart.tpl
type: file
unique_id: 5l46538p
icon: f:linechart.svg
helpText: Full line chart with axes and legends using Recharts
options:
  - name: dataSource
    display: Data Source
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: dataVariable
    display: Data Variable
    type: text
    settings:
      propertyCondition: dataSource
      condition: useVar
      active: true
  - name: dataKey
    display: Y-Axis Data Key
    type: text
  - name: xAxisKey
    display: X-Axis Data Key
    type: text
  - name: legendType
    display: Legend Type
    type: dropdown
    options: line;plainline;square;rect;circle;cross;diamond;star;triangle;wye;none
  - name: strokeColor
    display: Line Color
    type: text
  - name: height
    display: Chart Height
    type: text
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
{% set bpr %}
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set rawHeight = element.values.height | default('300') %}
{% if '%' in rawHeight %}
  {% set chartHeight = "'" ~ rawHeight ~ "'" %}
{% else %}
  {% set chartHeight = rawHeight %}
{% endif %}
{% set strokeColor = element.values.strokeColor | default('000') %}
{% set legendType = element.values.legendType | default('line') %}
{% set dataVar = element.values.dataVariable %}
{% if element.values.dataSource != 'useVar' %}
  {% set sourceField = element.values.dataSource | fieldData %}
  {% set dataVar = sourceField.column_name %}
{% endif %}
<ResponsiveContainer width="100%" height={ {{ chartHeight }} }>
  <LineChart data={ {{ dataVar }} }>
    <CartesianGrid strokeDasharray="3 3" />
    <XAxis dataKey="{{ element.values.xAxisKey | default('mes') }}" />
    <YAxis />
    <Tooltip />
    <Legend />
    <Line 
      type="monotone"
      dataKey="{{ element.values.dataKey | default('valor') }}"
      stroke="#{{ strokeColor }}"
      legendType="{{ legendType }}"
    />
  </LineChart>
</ResponsiveContainer>


