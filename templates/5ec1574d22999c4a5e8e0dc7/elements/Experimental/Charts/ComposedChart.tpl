/*
path: ComposedChart.tpl
type: file
unique_id: 5l4alkmn
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
  - name: verticalAlign
    display: Legend
    type: dropdown
    options:
      top;middle;bottom
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
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
{% set bpr %}
import { Legend, Tooltip, Line, CartesianGrid, XAxis, YAxis, ComposedChart, Area, Bar } from 'recharts';

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
<ComposedChart {% if element.values.width %}width={ {{element.values.width}} } {% endif %} 
{% if element.values.height %}height={ {{element.values.height}} }{% endif %} 
data={ {{ element.values.Variable }} }>
  <XAxis dataKey="{% if indexBy.column_name %}{{ indexBy.column_name }}{% else %}{{ element.values.indexVariable }}{% endif %}" padding={ {left: 25, right: 25} } />
  <YAxis />
  <Tooltip />
  <Legend />
  <CartesianGrid stroke="#f5f5f5" />
{{ content | raw }}
</ComposedChart>