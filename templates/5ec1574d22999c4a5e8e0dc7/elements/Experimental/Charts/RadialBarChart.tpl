/*
path: RadialBarChart.tpl
completePath: elements/Experimental/Charts/RadialBarChart.tpl
type: file
unique_id: 2s1fbMXv
icon: f:radialBarChart.svg
options:
  - name: width
    display: Width
    type: text
    options: ''
  - name: height
    display: Height
    type: text
    options: ''
  - name: cx
    display: Cx
    type: text
    options: ''
  - name: cy
    display: Cy
    type: text
    options: ''
  - name: startAngle
    display: Start Angle
    type: text
    options: ''
  - name: endAngle
    display: End Angle
    type: text
    options: ''
  - name: innerRadius
    display: Inner Radius
    type: text
    options: ''
    advanced: true
  - name: outerRadius
    display: Outer Radius
    type: text
    options: ''
    advanced: true
  - name: barSize
    display: Bar Size
    type: text
    options: ''
    advanced: true
  - name: legendWidth
    display: Legend width
    type: text
    options: ''
    advanced: true
  - name: legendHeight
    display: Legend height
    type: text
    options: ''
    advanced: true
  - name: verticalAlign
    display: Legend Vertical Align
    type: dropdown
    advanced: true
    options:
      return [['top', 'Top'],['middle', 'Middle'],['bottom', 'Bottom']]
  - name: align
    display: Legend Align
    type: dropdown
    advanced: true
    options:
      return [['left', 'Left'],['center', 'Center'],['right', 'Right']]
  - name: layout
    display: Legend Layout
    type: dropdown
    advanced: true
    options:
      return [['vertical', 'Vertical'],['horizontal', 'Horizontal']]
  - name: iconType
    display: Legend Icon Type
    type: dropdown
    advanced: true
    options: 
      return [['line', 'Line'],['plainline', 'Plain Line'],['square', 'Square'],['rect', 'Rect'],['circle', 'Circle'],['cross', 'Cross'],['diamond', 'Diamond'],['star', 'Star'],['triangle', 'Triangle'],['wye', 'Wye'],['none', 'None']]
  - name: iconSize
    display: Legend Icon Size
    type: text
    options: ''
    advanced: true
  - name: variable
    display: Variable to Use
    type: text
    required: true
  - name: dataKey
    display: Data Key
    type: text
    options: ''
    required: true
  - name: dataName
    display: Data Name
    type: text
    options: ''
    required: true
  - name: dataColor
    display: Data Color
    type: text
    options: ''
    required: true
  - name: tooltip
    display: Tooltip
    type: checkbox
  - name: background
    display: Background
    type: checkbox
    settings:
      default: true
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
{% set ph %}
  const {{ element.values.variable }}B = {{ element.values.variable }}.map(valor=>{

    return {
      name: valor.{{ element.values.dataName }},
      fill: valor.{{ element.values.dataColor }},
      {{ element.values.dataKey }}: valor.{{ element.values.dataKey }},
    }
  })
{% endset %}
{{ save_delayed('ph',ph) }}
<RadialBarChart 
  width={ {{ element.values.width|default("500") }} } 
  height={ {{ element.values.height|default("300") }} }
  cx={ "{{ element.values.cx|default("150") }}" }
  cy={ "{{ element.values.cy|default("150") }}" }
  startAngle={ {{ element.values.startAngle|default("180") }} } 
  endAngle={ {{ element.values.endAngle|default("-180") }} }
  innerRadius={ "{{ element.values.innerRadius|default("20") }}" } 
  outerRadius={ "{{ element.values.outerRadius|default("140") }}" } 
  barSize={ "{{ element.values.barSize|default("10") }}" } 
  data={ {{ element.values.variable }}B }>
  <RadialBar
    isAnimationActive={false}
    label={ {position: "insideStart" , fill: "black"} }
    background={ {{ element.values.background|default("true") }} }
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