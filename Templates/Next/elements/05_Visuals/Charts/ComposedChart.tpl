/*
path: ComposedChart.tpl
completePath: elements/Experimental/Charts/ComposedChart.tpl
type: file
unique_id: 5l4alkmn
icon: ico-composed-chart
options:
  - name: width
    display: Chart width (in pixels)
    type: text
    options: ''
  - name: height
    display: Chart height (in pixels)
    type: text
    options: ''
  - name: verticalAlign
    display: Legend
    type: dropdown
    options:
      top;middle;bottom
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
  - name: onClickLegend
    display: onClick Legend
    type: function
    options: ''
    advanced: true
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
  - name: hideX
    display: Hide X Axis
    type: checkbox
    advanced: true
  - name: hideY
    display: Hide Y Axis
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
import { Legend, Tooltip, Line, CartesianGrid, XAxis, YAxis, ComposedChart, Area, Bar, ResponsiveContainer } from 'recharts'
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
  data={ {{ element.values.Variable }} }>
  <XAxis dataKey="{% if indexBy.column_name %}{{ indexBy.column_name }}{% else %}{{ element.values.indexVariable }}{% endif %}" {% if element.values.hideX %}hide={true}{% endif %}/>
  <YAxis {% if element.values.hideY %}hide={true}{% endif %} />
  <Tooltip />
  {% if not element.values.hideLegend %}
  {{ content | raw }}
  <Legend
  {% if element.values.onClickLegend %}
  onClick={ {{element.values.onClickLegend | functionOrCall}} }
  {% endif %}
   />
  {% endif %}
  {% if not element.values.hideGrid %}<CartesianGrid stroke="#f5f5f5" />{% endif %}
</ComposedChart>
{% if element.values.responsive %}</ResponsiveContainer>{% endif %}