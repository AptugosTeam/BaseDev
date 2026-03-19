/*
icon: ico-pie-chart
path: pieChart.tpl
sourceType: javascript
unique_id: oOgmBJJQ
settings:
  - name: Packages
    value: '"@nivo/pie": "latest","@nivo/core": "latest",'
options:
  - name: variableName
    display: Variable Name
    type: text
    options: ''
  - name: Scheme
    display: Scheme
    type: dropdown
    options: >-
      nivo;category10;accent;dark2;paired;pastel1;pastel2;set1;set2;set3;brown_blueGreen;purpleRed_green;pink_yellowGreen;purple_orange;red_blue;red_grey;red_yellow_blue;red_yellow_green;spectral;blues;greens;greys;oranges;purples;reds;blue_green;blue_purple;green_blue;orange_red;purple_blue_green;purple_blue;purple_red;red_purple;yellow_green_blue;yellow_green;yellow_orange_brown;yellow_orange_red
  - name: Code
    display: Use Code instead
    type: text
    options: ''
*/
{% set bpr %}
import { ResponsivePie } from '@nivo/pie'
{% endset %}
{{ save_delayed('bpr',bpr) }}
{% if element.values.Code %}
  {% set ph %}
    {{ element.values.Code | raw }}
  {% endset %}
  {{ save_delayed('ph',ph) }}
{% endif %}
<ResponsivePie
  activeOuterRadiusOffset={8}
  data={ {{ element.values.variableName }} }
  margin={ { top: 40, right: 80, bottom: 80, left: 80 } }
  colors={ { scheme: '{{ element.values.Scheme }}' } }
/>
