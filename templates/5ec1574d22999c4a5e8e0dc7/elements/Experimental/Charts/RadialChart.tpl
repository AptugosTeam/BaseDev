/*
path: RadialChart.tpl
completePath: elements/Experimental/Charts/RadialChart.tpl
type: file
unique_id: 2s1fbMXv
icon: ico-chart-js
options:
  - name: width
    display: width
    type: text
    options: ''
  - name: height
    display: height
    type: text
    options: ''
  - name: cx
    display: cx
    type: text
    options: ''
  - name: cy
    display: cy
    type: text
    options: ''
  - name: innerRadius
    display: innerRadius
    type: text
    options: ''
  - name: outerRadius
    display: outerRadius
    type: text
    options: ''
  - name: startAngle
    display: startAngle
    type: text
    options: ''
  - name: endAngle
    display: endAngle
    type: text
    options: ''
  - name: barSize
    display: Bar Size
    type: text
    options: ''
  - name: legendWidth
    display: Legend width
    type: text
    options: ''
  - name: legendHeight
    display: Legend height
    type: text
    options: ''
  - name: verticalAlign
    display: Legend Vertical Align
    type: dropdown
    options:
      top;middle;bottom
  - name: align
    display: Legend Align
    type: dropdown
    options:
      left;center;right
  - name: layout
    display: Legend Layout
    type: dropdown
    options:
      vertical;horizontal
  - name: iconType
    display: Legend Icon Type
    type: dropdown
    options: 
      line;plainline;square;rect;circle;cross;diamond;star;triangle;wye;none
  - name: iconSize
    display: Icon Size
    type: text
    options: ''
  - name: Variable
    display: Variable to Use
    type: text
  - name: Index
    display: XAxis Variable
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: indexVariable
    display: XAxis Variable
    type: text
    settings:
      propertyCondition: Index
      condition: useVar
      active: true
  - name: dataKey
    display: dataKey
    type: text
    options: ''
  - name: tooltip
    display: Tooltip
    type: checkbox
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
{% set bpr %}
import {
  RadialBarChart,
  RadialBar,
  Legend,
  Tooltip
} from "recharts";
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set name = element.values.indexVariable %}
{% if element.values.Index != 'useVar' %}
  {% set indexBy = element.values.Index|fieldData %}
  {% set values = element.values.Values|fieldData %}
  {% set indexName = indexBy.column_name %}
  {% set valuesName = values.column_name %}
  {% include includeTemplate('loadFromRedux.tpl') with { 'data': indexBy.table.unique_id } %}
{% endif %}
<RadialBarChart 
  width={ {{element.values.width|default("500")}} } 
  height={ {{element.values.height|default("300")}} }
  cx={ {{element.values.cx|default("150") }} }
  cy={ {{element.values.cy|default("150") }} }
  innerRadius={ {{element.values.innerRadius|default("20")}} } 
  outerRadius={ {{element.values.outerRadius|default("140")}} } 
  startAngle={ {{element.values.startAngle|default("360")}} } 
  endAngle={ {{element.values.endAngle|default("0")}} }
  barSize={ {{element.values.barSize|default("10")}} } 
  data={ {{ element.values.Variable }} }>
  <RadialBar
    isAnimationActive={false}
    label={ {position: "insideStart" , fill: "black"} }
    background
    dataKey={ "{{ element.values.dataKey }}" }
  />
  <Legend
    iconSize={ {{ element.values.iconSize|default("10") }} }
    width={ {{ element.values.legendWidth|default("120") }} }
    height={ {{ element.values.legendHeight|default("140") }} }
    layout={ "{{ element.values.layout|default("vertical") }}" }
    verticalAlign={ "{{ element.values.verticalAlign|default("middle") }}" }
    iconType={ "{{ element.values.iconType|default("line") }}" }
    align={ "{{ element.values.align|default("right") }}" }
  />
  {% if element.values.tooltip %}
    <Tooltip />
  {% endif %}
{{ content | raw }}
</RadialBarChart>