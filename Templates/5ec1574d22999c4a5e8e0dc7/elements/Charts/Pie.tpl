/*
path: Pie.tpl
completePath: elements/Experimental/Charts/Pie.tpl
type: file
unique_id: ajkld33t
icon: ico-google-analytics
options:
  - name: startSeparatorPieChart
    display: PieChart Properties
    type: separator
  - name: width
    display: PieChart width (in pixels)
    type: text
    options: ''
  - name: height
    display: PieChart height (in pixels)
    type: text
    options: ''
  - name: startSeparatorResponsive
    display: Responsive Properties
    type: separator
  - name: responsive
    display: Responsive?
    type: checkbox
    options: ''
  - name: responsiveWidth
    display: Container width (in pixels or percentage)
    type: text
    options: ''
    settings:
      propertyCondition: responsive
      condition: true
  - name: responsiveHeight
    display: Container height (in pixels or percentage)
    type: text
    options: ''
    settings:
      propertyCondition: responsive
      condition: true
  - name: startSeparatorPie
    display: Pie Properties
    type: separator
  - name: Variable
    display: Variable to Use
    type: text
  - name: dataKeyPie
    display: value of each sector (dataKeyPie)
    type: text
  - name: nameKeyPie
    display: name of each sector (nameKeyPie)
    type: text  
  - name: Xcoordinate
    display: The x-coordinate of center (cx)
    type: text
  - name: Ycoordinate
    display: The y-coordinate of center (cy)
    type: text
  - name: innerRadiusValue
    display: The inner radius of all the sectors
    type: text
    settings:
      default: '0'
  - name: outerRadiusValue
    display: The outer radius of all the sectors
    type: text
    settings:
      default: '80%'
  - name: LabelPie
    display: Chart Segment Labels
    type: text
    settings:
      default: 'false'
  - name: LabelsLine
    display: Labels Line
    type: text
    settings:
      default: 'false'
  - name: startSeparatorCell
    display: Cell Properties
    type: separator
  - name: CellColors 
    display: Color of the graph sections (Cell)
    type: text
  - name: startSeparatorAdvancedProperties
    display: Advanced Properties
    type: separator
    advanced: true
  - name: values
    display: Values YAxis
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
    advanced: true
  - name: valuesVariable
    display: Values Variable
    type: text
    settings:
      propertyCondition: values
      condition: useVar
      active: true
    advanced: true
  - name: legendType
    display: Legend Type
    type: dropdown
    options: line;plainline;square;rect;circle;cross;diamond;star;triangle;wye;none
    advanced: true
  - name: colors
    display: Fill Color
    type: text
    advanced: true
  - name: opacity
    display: Opacity
    type: dropdown
    options: 0.0;0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1
    advanced: true
  - name: tooltip
    display: Tooltip
    type: text
    advanced: true
  - name: tooltipFormatter
    display: Tooltip formatter (JS code)
    type: text
    advanced: true  
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
{% set bpr %}
import { PieChart, Pie, Sector, Cell, Tooltip, ResponsiveContainer, Legend } from 'recharts'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
const colors{{ element._unique_id }} = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042']
{% endset %}
{{ save_delayed('ph',ph)}}
{% if element.values.values != 'useVar' %}
  {% set values = element.values.values|fieldData %}
{% endif %}
{% if element.values.responsive %}<ResponsiveContainer
{% if element.values.responsiveWidth %}width={ {{element.values.responsiveWidth}} }{% endif %} 
  height={ {{element.values.responsiveHeight | default(300)}} }
>{% endif %}
<PieChart
{% if element.values.width %}width={ {{element.values.width}} }{% endif %} 
{% if element.values.height %}height={ {{element.values.height}} }{% endif %}
>
      <Pie
        data={ {{ element.values.Variable }} }
        {% if element.values.Xcoordinate %}cx={ {{ element.values.Xcoordinate }} }{% else %}cx= '50%'{% endif %}
        {% if element.values.Ycoordinate %}cy={ {{ element.values.Ycoordinate }} }{% else %}cy= '50%'{% endif %}
        {% if element.values.innerRadiusValue %}innerRadius={ {{ element.values.innerRadiusValue }} }{% else %}innerRadius= '0'{% endif %}
        {% if element.values.outerRadiusValue %}outerRadius="{{ element.values.outerRadiusValue }}"{% else %}outerRadius="80%" {% endif %}
        {% if element.values.LabelPie %}label={ {{ element.values.LabelPie }} }{% else %}label={false}{% endif %}
        {% if element.values.LabelsLine %}labelLine={ {{ element.values.LabelsLine }} }{% else %}labelLine={false}{% endif %}
        {% if element.values.dataKeyPie %}dataKey="{{ element.values.dataKeyPie }}"{% endif %}
        {% if element.values.nameKeyPie %}nameKey="{{ element.values.nameKeyPie }}"{% endif %}
      >
        { {{ element.values.Variable }}.map((entry, index) => (
          <Cell key={`cell-${index}`} {% if element.values.CellColors %}fill={ {{ element.values.CellColors }} }{% else %}fill={colors{{ element._unique_id }}[index % colors{{ element._unique_id }}.length]}{% endif %} />
        ))}
      </Pie>
      <Tooltip
        {% if element.values.tooltip %}
          content={({ payload }) => {{ element.values.tooltip }} }
        {% endif %}
        {% if element.values.tooltipFormatter %}
          formatter={ {{ element.values.tooltipFormatter }} }
        {% endif %}
      />
      <Legend
        {% if element.values.legendType and element.values.legendType != 'none' %}
        iconType="{{ element.values.legendType }}"
        {% endif %}
        layout="vertical"
        align="right"
        verticalAlign="middle"
      />
      </PieChart>
        {% if element.values.responsive %}</ResponsiveContainer>{% endif %}