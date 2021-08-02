/*
path: chartsJS.tpl
type: file
unique_id: 9fUBawmx
icon: ico-chart-js
settings:
  - name: Packages
    value: '"react-chartjs-2": "latest","chart.js":"latest",'
children: []
options:
  - name: data
    display: Data Variable
    type: text
    options: ''
  - name: title
    display: Title
    type: text
    options: ''
*/

{% set bpr %}
import { Bar } from 'react-chartjs-2'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Bar
    data={ {{ element.values.data }}}
    options={ {
        title:{
            display:true,
            text:'{{ element.values.title }}',
            fontSize:20
        },
        legend:{
            display:true,
            position:'bottom'
        }
    } }
/>