/*
path: ComposedChart.tpl
completePath: elements/Experimental/Charts/ComposedChart.tpl
type: file
unique_id: 5l4alkmn
icon: f:ComposedChart.svg
options:
  - name: width
    display: Chart width (in pixels)
    type: text
    options: ''
  - name: height
    display: Chart height (in pixels)
    type: text
    options: ''
  - name: verticalLayout
    display: Vertical Layout?
    type: checkbox
    options: ''
  - name: barGap
    display: Gap between two bars in the same category.?
    type: text
    options: ''
  - name: startSeparator
    display: Legend Properties
    type: separator
  - name: layout
    display: Legend
    type: dropdown
    options:
      horizontal;vertical
  - name: verticalAlign
    display: Legend
    type: dropdown
    options:
      top;middle;bottom
  - name: align
    display: legend horizontal position
    type: dropdown
    options:
      left;center;right
  - name: onClickLegend
    display: onClick Legend
    type: function
    options: ''
    advanced: true
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
  - name: tickFormatter
    display: The formatter function of tick
    type: text
  - name: strokeDasharray
    display: Lines of the Cartesian Grid
    type: text
  - name: stroke
    display: Stroke Color
    type: text
  - name: style
    display: Stroke Style
    type: text
  - name: yAxisVar
    display: YAxis Variable
    type: text
    advanced: true
  - name: hideX
    display: Hide XAxis
    type: checkbox
    advanced: true
  - name: tickLX
    display: Disable XAxis Tick Line
    type: checkbox
    advanced: true
  - name: tickY
    display: Disable YAxis Ticks
    type: checkbox
    advanced: true
  - name: topX
    display: XAxis on Top
    type: checkbox
    advanced: true
  - name: typeX
    display: XAxis type number
    type: checkbox
    advanced: true
  - name: typeY
    display: YAxis type category
    type: checkbox
    advanced: true
  - name: domainX
    display: XAxis Domain
    type: text
    advanced: true
  - name: ticksX
    display: XAxis Ticks
    type: text
    advanced: true
  - name: hideY
    display: Hide YAxis
    type: checkbox
    advanced: true
  - name: hideLegend
    display: Hide Legend
    type: checkbox
    advanced: true
  - name: hideGrid
    display: Hide Cartesian Grid
    type: checkbox
    advanced: true
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
{% set bpr %}
import { Area, Bar, CartesianGrid, Cell, ComposedChart, BarChart, Legend, Line, ResponsiveContainer, Tooltip, XAxis, YAxis } from 'recharts'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set ph %}
{% set name = element.values.indexVariable %}
{% if element.values.Index != 'useVar' %}
  {% set indexBy = element.values.Index|fieldData %}
  {% set values = element.values.Values|fieldData %}
  {% set indexName = indexBy.column_name %}
  {% set valuesName = values.column_name %}
  {% include includeTemplate('loadFromRedux.tpl') with { 'data': indexBy.table.unique_id } %}
{% endif %}
{% endset %}
{{ save_delayed('ph',ph)}}
{% if element.values.responsive %}
<ResponsiveContainer 
 {% if element.values.responsiveWidth %}width={ {{element.values.responsiveWidth}} }{% endif %} 
  height={ {{element.values.responsiveHeight | default(300)}} }
>
{% endif %}
  <ComposedChart
    {% if element.values.width %}width={ {{element.values.width}} }{% endif %} 
    {% if element.values.height %}height={ {{element.values.height}} }{% endif %}
    {% if element.values.verticalLayout %}layout="vertical"{% endif %}
    {% if element.values.barGap %}barGap={ {{element.values.barGap}} }{% endif %}
    data={ {{ element.values.Variable | default([]) }} }
    margin={ {
      top: 20,
      right: 20,
      bottom: 20,
      left: 20,
    } }
  >
    {% if not element.values.hideGrid %}
    <CartesianGrid
    {% if element.values.strokeDasharray %}strokeDasharray="{{element.values.strokeDasharray}}"{% endif %}
    {% if element.values.stroke %}stroke="{{element.values.stroke}}"{% else %}stroke="#f5f5f5"{% endif %}
    {% if element.values.style %}style={ {{element.values.style}} }{% endif %}
    />
    {% endif %}
    <XAxis 
      {% if indexBy.column_name or element.values.indexVariable%}
      dataKey="{% if indexBy.column_name %}{{ indexBy.column_name }}{% else %}{{ element.values.indexVariable }}{% endif %}"
      {% endif %}
      {% if element.values.topX %}orientation="top"{% endif %}
      {% if element.values.hideX %}hide={true}{% endif %}
      {% if element.values.tickLX %}tickLine={false}{% endif %}
      {% if element.values.typeX %}type="number"{% endif %}
      {% if element.values.domainX %}domain={ {{element.values.domainX}} }{% endif %}
      {% if element.values.ticksX %}ticks={ {{element.values.ticksX}} }{% endif %}
    />
    <YAxis 
      {% if element.values.hideY %}hide={true}{% endif %} 
      {% if element.values.typeY %}type="category"{% endif %}
      {% if element.values.tickY %}tick={false}{% endif %}
      {% if element.values.yAxisVar %}dataKey="{{ element.values.yAxisVar }}"{% endif %}
      {% if element.values.tickFormatter %}tickFormatter={ {{element.values.tickFormatter}} }{% endif %}
    />
    <Tooltip />
    <Legend 
    layout="{{element.values.layout|default('horizontal')}}" 
    align="{{element.values.align|default('center')}}" 
    verticalAlign="{{element.values.verticalAlign|default('bottom')}}" 
    {% if not element.values.hideLegend %}
      {% if element.values.onClickLegend %}
        onClick={ {{element.values.onClickLegend | functionOrCall}} }
      {% endif %}
    {% endif %}
    />
    {{ content | raw }}
  </ComposedChart>
{% if element.values.responsive %}</ResponsiveContainer>{% endif %}