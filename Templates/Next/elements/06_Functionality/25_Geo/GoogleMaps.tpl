/*
path: GoogleMaps.tpl
type: file
unique_id: egrlpGq3
icon: ico-googlemaps
order: 10
children: []
settings:
  - name: Packages
    value: '"@vis.gl/react-google-maps": "1.4.2",'
options:
  - name: className
    display: ClassName
    type: styles
  - name: center
    display: Center
    type: text
    settings:
      default: '{ lat: 47.444, lng: -122.176}'
  - name: Zoom
    display: Zoom (number or variable)
    type: text
    options: ''
    settings:
      default: '8'
      active: true
  - name: Key
    display: Api Key (see docs for info)
    type: text
    options: ''
  - name: Width
    display: Width (sets the width in pixels)
    type: text
    options: ''
    settings:
      default: '300'
      active: true
  - name: Height
    display: Height (sets the width in pixels)
    type: text
    options: ''
    settings:
      default: '300'
      active: true
  - name: variableName
    display: Variable Name
    type: text
    settings:
      aptugoOnChange: >-
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        const variableName = element.values.variableName || 'map_' + element.unique_id + '_position';
        aptugo.variables.setPageVariable(page, element.unique_id, { [variableName]: element.values ? element.values.center : null });
        aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${variableName}` );
      aptugoOnLoad: >-
        const element = arguments[0];
        const page = aptugo.pageUtils.findContainerPage(element.unique_id).unique_id;
        const variableName = element.values.variableName || 'map_' + element.unique_id + '_position';
        aptugo.variables.setPageVariable(page, element.unique_id, { [variableName]: element.values ? element.values.center : null });
        aptugo.variables.setPageFunction(page, 'f' + element.unique_id, `set${variableName}` );
        
*/
{% set variableName = element.values.variableName|default('map_' ~ element.unique_id ~ '_position') %}
{% set bpr %}
import { APIProvider, Map } from '@vis.gl/react-google-maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% include includeTemplate(['useState.tpl']) with { 'element': { 'values': { variableName: variableName, defaultValue: "{ lat: 47.444, lng: -122.176}"} } } %}
<div 
  {% if element.values.className %}className={ {{ element.values.className}} }{% endif %}
  style={ { width: '{{ element.values.Width }}px', height: '{{ element.values.Height }}px', position: 'relative' } }
>
  <APIProvider apiKey={'{{ element.values.Key }}'}>
    <Map 
      defaultCenter={ {{ variableName }} }
      defaultZoom={ {{ element.values.Zoom|default(8) }} }
      mapId="map_{{ element.unique_id }}"
    >{{ content | raw }}</Map>
  </APIProvider>
</div>