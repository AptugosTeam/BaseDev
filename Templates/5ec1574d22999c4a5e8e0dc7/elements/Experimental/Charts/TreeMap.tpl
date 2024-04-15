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
  - name: colors
    display: Fill Color
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
    const { root, depth, x, y, width, height, index, payload, subtitle, name } = this.props
    const colors = ['#8889DD', '#9597E4', '#8DC77B', '#A5D297', '#E2CF45', '#F8C12D']

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
    content={<CustomizedContent colors={COLORS} />}
  {% endif %}
  width={ {{ element.values.width | default('800') }} }
  height={500} data={ {{ varToUse }} } dataKey="size" aspectRatio={4 / 3} stroke="#fff" fill="#8884d8" animationDuration={100}
/>