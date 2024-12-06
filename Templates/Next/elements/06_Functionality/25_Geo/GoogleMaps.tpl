/*
path: GoogleMaps.tpl
type: file
unique_id: egrlpGq3
icon: ico-googlemaps
children: []
settings:
  - name: Packages
    value: '"google-maps-react": "^2.0.6",'
  - name: DevPackages
    value: '"@types/google.maps": "latest",'
options:
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
*/
{% set bpr %}
import { Map, Marker } from 'google-maps-react'
{% endset %}
{{ save_delayed('bpr',bpr)}}
{% set ph %}
const [mapPosition, setmapPosition] = React.useState({ lat: 47.444, lng: -122.176})
{% endset %}
{{ save_delayed('ph',ph) }}
{% set ph %}
const [showMap, setshowMap] = React.useState(false)
React.useEffect(() => {
    const googleMapScript = document.createElement('script');
    googleMapScript.src=`https://maps.googleapis.com/maps/api/js?key={{ element.values.Key }}`;
    googleMapScript.async = true;
    window.document.body.appendChild(googleMapScript);
    googleMapScript.addEventListener('load', () => {
      setshowMap(true)
    });
},[])
{% endset %}
{{ save_delayed('ph',ph)}}
<div style={ { width: '{{ element.values.Width }}px', height: '{{ element.values.Height }}px', position: 'relative' } }>
{showMap && 
    <Map
        google={window.google}
        zoom={ {{ element.values.Zoom|default(2) }} }
        initialCenter={ mapPosition }
    >{{ content | raw }}
    </Map>
}
</div>