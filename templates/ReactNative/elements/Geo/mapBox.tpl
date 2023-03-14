/*
path: mapBox.tpl
keyPath: elements/Geo/mapBox.tpl
unique_id: z2fTET0T
icon: ico-leaflet
options:
  - name: accessToken
    display: Access Token
    type: text
  - name: className
    display: ClassName
    type: styles
  - name: logoEnabled
    display: Logo Enabled
    type: checkbox
    settings:
      default: true
  - name: compassEnabled
    display: Compass Enabled
    type: checkbox
  - name: rotateEnabled
    display: Rotation Enabled
    type: checkbox
    settings:
      default: true
  - name: attributionEnabled
    display: Attribution Enabled
    type: checkbox
    settings:
      default: true
  - name: scaleBarEnabled
    display: ScaleBar Enabled
    type: checkbox
    settings:
      default: true
  - name: scaleBarPosition
    display: ScaleBar Position
    type: text
settings:
  - name: Packages
    value: '"@rnmapbox/maps": "github:rnmapbox/maps#main",'
*/
{% set bpr %}
import { MapView } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<MapView
  logoEnabled={ {{element.values.logoEnabled|default(true)}}}
  compassEnabled={ {{element.values.compassEnabled|default(false)}}}
  rotateEnabled={ {{element.values.rotateEnabled|default(true)}}}
  attributionEnabled={ {{element.values.attributionEnabled|default(true)}}}
  scaleBarEnabled={ {{element.values.scaleBarEnabled|default(true)}}}
  {% if element.values.scaleBarEnabled %}scaleBarPosition={ {{element.values.scaleBarPosition|default('{ bottom: 8, left: 8}')}} }{% endif %}
  style={ {{ element.values.className}} }
>{{ content | raw }}</MapView>


