/*
path: radar.tpl
completePath: elements/Experimental/Charts/radar.tpl
type: file
unique_id: p28RJJ6S
icon: ico-chart-js
children: []
settings:
  - name: Packages
    value: '"@nivo/radar": "latest","@nivo/core": "latest",'
options:
  - name: Scheme
    display: Color Scheme
    type: dropdown
    options: >-
      nivo;category10;accent;dark2;paired;pastel1;pastel2;set1;set2;set3;brown_blueGreen;purpleRed_green;pink_yellowGreen;purple_orange;red_blue;red_grey;red_yellow_blue;red_yellow_green;spectral;blues;greens;greys;oranges;purples;reds;blue_green;blue_purple;green_blue;orange_red;purple_blue_green;purple_blue;purple_red;red_purple;yellow_green_blue;yellow_green;yellow_orange_brown;yellow_orange_red
  - name: data
    display: Data
    type: text
    options: ''
  - name: keys
    display: Keys
    type: text
    options: ''
  - name: indexBy
    display: Index By
    type: text
*/
{% set bpr %}
import { ResponsiveRadar } from '@nivo/radar'
{% endset %}
{{ save_delayed('bpr',bpr) }}
<ResponsiveRadar
  data={ {{ element.values.data }} }
  keys={ {{ element.values.keys }} }
  indexBy={{ element.values.indexBy | textOrVariable }}
  colors={ { scheme: '{{ element.values.Scheme }}' } }
  maxValue="auto"
  margin={ { top: 70, right: 80, bottom: 40, left: 80 } }
  curve="linearClosed"
  borderWidth={2}
  borderColor={ { from: 'color' } }
  gridLevels={5}
  gridShape="circular"
  gridLabelOffset={36}
  enableDots={false}
  dotSize={10}
  dotColor={ { theme: 'background' } }
  dotBorderWidth={2}
  dotBorderColor={ { from: 'color' } }
  enableDotLabel={true}
  dotLabel="value"
  dotLabelYOffset={-12}
  fillOpacity={0.25}
  blendMode="multiply"
  animate={true}
  motionConfig="wobbly"
  isInteractive={true}
  legends={[
    {
      anchor: 'top-left',
      direction: 'column',
      translateX: -50,
      translateY: -40,
      itemWidth: 80,
      itemHeight: 20,
      itemTextColor: '#999',
      symbolSize: 12,
      symbolShape: 'circle',
      effects: [
        {
            on: 'hover',
            style: {
                itemTextColor: '#000'
            }
        }
      ]
    }
  ]}
/>   
