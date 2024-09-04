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
  - name: ref
    display: Use Reference
    type: text
    options: ''
  - name: onMapIdle
    display: On Map Idle
    type: function
settings:
  - name: Packages
    value: '"expo-dev-client": "~2.4.13","@rnmapbox/maps": "github:rnmapbox/maps#main",'
*/
{% set AppJsonPlugins %}
[
  "@rnmapbox/maps",
  {
    "RNMapboxMapsVersion": "11.3.0",
    "RNMapboxMapsDownloadToken": "{{ element.values.accessToken }}"
  }],
  [
    "expo-build-properties",
    {
      "MAPBOX_DOWNLOADS_TOKEN": "{{ element.values.accessToken }}"
    }
],
{% endset %}
{{ add_setting('AppJsonPlugins', AppJsonPlugins)}}
{% set bpr %}
import { MapView, setAccessToken } from '@rnmapbox/maps'
setAccessToken('{{ element.values.accessToken }}')
{% endset %}
{{ save_delayed('bpr',bpr)}}
<MapView
  {% if element.values.ref %}ref={ {{element.values.ref}} }{% endif %}
  logoEnabled={ {{element.values.logoEnabled|default(true)}}}
  compassEnabled={ {{element.values.compassEnabled|default(false)}}}
  rotateEnabled={ {{element.values.rotateEnabled|default(true)}}}
  attributionEnabled={ {{element.values.attributionEnabled|default(true)}}}
  scaleBarEnabled={ {{element.values.scaleBarEnabled|default(true)}}}
  {% if element.values.scaleBarEnabled %}scaleBarPosition={ {{element.values.scaleBarPosition|default('{ bottom: 8, left: 8}')}} }{% endif %}
  {% if element.values.className %}style={ {{ element.values.className}} }{% endif %}
  {% if element.values.onMapIdle %}
    onMapIdle={ {{ element.values.onMapIdle |functionOrCall }} }
  {% endif %}
>{{ content | raw }}</MapView>


