/*
path: chartbar.tpl
type: file
unique_id: I4IK8OXW
icon: ico-chart-bar
helpText: Uses Nivo Charting library to draw a chart
sourceType: javascript
settings:
  - name: Packages
    value: '"@nivo/bar": "latest","@nivo/core": "latest",'
options:
  - name: Responsive
    display: Responsive
    type: checkbox
    options: ''
  - name: Width
    display: Width
    type: text
    options: ''
  - name: Height
    display: Height
    type: text
    options: ''
  - name: Scheme
    display: Scheme
    type: dropdown
    options: >-
      nivo;category10;accent;dark2;paired;pastel1;pastel2;set1;set2;set3;brown_blueGreen;purpleRed_green;pink_yellowGreen;purple_orange;red_blue;red_grey;red_yellow_blue;red_yellow_green;spectral;blues;greens;greys;oranges;purples;reds;blue_green;blue_purple;green_blue;orange_red;purple_blue_green;purple_blue;purple_red;red_purple;yellow_green_blue;yellow_green;yellow_orange_brown;yellow_orange_red
  - name: Index
    display: Index By
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: indexVariable
    display: Index By Variable
    type: text
    settings:
      propertyCondition: Index
      condition: useVar
      active: true
  - name: Values
    display: Values
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: valuesVariable
    display: Values Variable
    type: text
    settings:
      propertyCondition: Values
      condition: useVar
      active: true
  - name: LeftAxisLegend
    display: 'Left Axis: Legend'
    type: text
    options: ''
  - name: Variable
    display: Variable to Use
    type: text
  - name: Code
    display: Use Code instead
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { {% if element.values.Responsive %}ResponsiveBar{% else %}Bar{% endif %} } from '@nivo/bar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% set indexName = element.values.indexVariable %}
{% set valuesName = element.values.valuesVariable %}
{% if element.values.Code %}
  {% set ph %}
  {{ element.values.Code | raw }}
  {% endset %}
  {{ save_delayed('ph',ph) }}
{% else %}
  {% if element.values.Index != 'useVar' %}
    {% set indexBy = element.values.Index|fieldData %}
    {% set values = element.values.Values|fieldData %}
    {% set indexName = indexBy.column_name %}
    {% set valuesName = values.column_name %}
    {% include includeTemplate('loadFromRedux.tpl') with { 'data': indexBy.table.unique_id } %}
    {% set ph %}
    const chartdata = []
    {{ element.values.Variable }}.forEach({{ indexBy.table.singleName | friendly | lower }} => {
      chartdata.push({ 
        {{ indexBy.column_name }}: {{ indexBy.table.singleName | friendly | lower }}.{{ indexBy.column_name }},
        {{ values.column_name }}: {{ indexBy.table.singleName | friendly | lower }}.{{ values.column_name }}
      })  
    })
    {% endset %}
    {{ save_delayed('ph',ph) }}
  {% endif %}
{% endif %}
<{% if element.values.Responsive %}ResponsiveBar{% else %}Bar{% endif %}
  {% if element.values.Width %}width={ {{ element.values.Width }} }{% endif %}
  {% if element.values.Height %}height={ {{ element.values.Height }} }{% endif %}
  colors={ { scheme: '{{ element.values.Scheme }}' } }
  indexBy={ {{ indexName }} }
  data={ {% if element.values.Index == 'useVar' %}{{ element.values.Variable }}{% else %}chartdata{% endif %} }
  keys={ {{ valuesName }} }
  groupMode='grouped'
        margin={ { top: 50, right: 50, bottom: 50, left: 60 } }
        padding={0.3}
        borderColor={ { from: 'color', modifiers: [ [ 'darker', 1.6 ] ] } }
        axisTop={null}
        axisRight={null}
        enableLabel={false} 
        axisBottom={ {
            tickSize: 5,
            tickPadding: 5,
            tickRotation: 0,
            legend: 'response',
            legendPosition: 'middle',
            legendOffset: 32
        } }
        axisLeft={ {
            tickSize: 5,
            tickPadding: 5,
            tickRotation: 0,
            legend: '{{ element.values.LeftAxisLegend }}',
            legendPosition: 'middle',
            legendOffset: -40
        } }
        labelSkipWidth={12}
        labelSkipHeight={12}
        labelTextColor={ { from: 'color', modifiers: [ [ 'darker', 1.6 ] ] } }
        animate={true}
        motionStiffness={90}
        motionDamping={15}
    />