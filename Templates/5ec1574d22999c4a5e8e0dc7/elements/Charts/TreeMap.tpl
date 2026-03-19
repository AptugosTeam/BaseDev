/*
path: TreeMap.tpl
completePath: elements/Experimental/Charts/TreeMap.tpl
type: file
unique_id: 5ahjlw3r
icon: ico-chart-bar
options:
  - name: values
    display: Values
    type: dropdown
    options: return [['useVar','Use a Variable'], ...aptugo.tableUtils.getAllFields()]
  - name: valuesVariable
    display: Values Variable
    type: text
    settings:
      propertyCondition: values
      condition: useVar
      active: true
  - name: width
    display: Chart width
    type: text
    settings:
      default: '800'
      active: true
  - name: height
    display: Chart height
    type: text
    settings:
      default: '500'
      active: true
  - name: colors
    display: Fill Color
    type: text
  - name: textColor
    display: Text color
    type: text
settings:
  - name: Packages
    value: '"recharts": "^2.1.13",'
children: []
*/
{% set varToUse = element.values.values %}
{% if element.values.values == 'useVar' %}
  {% set varToUse = element.values.valuesVariable %}
{% endif %}


{% set bpr %}
import { PureComponent } from 'react'
import { Treemap, ResponsiveContainer } from 'recharts'

{% if element.children %}
class CustomizedContent extends PureComponent {
  render() {
    // @ts-ignore
    const { root, depth, x, y, width, height, index, payload, subtitle, name, category } = this.props
    {% if element.children %}
    const colors = {{ element.values.colors}}
    {% endif %}
    return (
      {% for child in element.children %}
        {{ child.rendered | raw }}
      {% endfor %}
    )
  }
}
{% endif %}

{% endset %}
{{ save_delayed('bpr',bpr) }}
<Treemap
  {% if element.children %}
    content={<CustomizedContent colors={colors} />}
  {% endif %}
  width={ {{ element.values.width | default('800') }} }
  height={ {{ element.values.height | default('500') }} } data={ {{ varToUse }} } dataKey="size" aspectRatio={4 / 3} stroke=" {{ element.values.textColor }} " fill="#8884d8" animationDuration={100}
/>