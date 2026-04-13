/*
path: FlickSearch.tpl
type: file
unique_id: nZQBVwLf
icon: ico-flick-search
helpText: Search Flickr photos by API key and optional geo radius, then use the results inside the child block
children: []
options:
  - name: apikey
    display: API Key
    helpText: Flickr API key used to authenticate the search request
    type: text
    options: ''
  - name: hasgeo
    display: Only pics with Geo Data
    helpText: When enabled, only photos with geolocation metadata are returned
    type: checkbox
    options: ''
  - name: radius
    display: Radius in KM
    helpText: Search radius in kilometers when filtering by geolocated photos
    type: text
    options: ''
*/


{% set bpr %}
import axios from 'axios'
{% endset %}
{{ save_delayed('bpr',bpr) }}
const flickParams = {
    method: 'flickr.photos.search',
    api_key: '{{ element.values.apikey|default('9dcc79c1af21dcbd961a3161b512f923') }}',
    {% if element.values.hasgeo %}has_geo: true,{% endif %}
    radius: '{{ element.values.radius|default('10') }}km',
    format: 'json',
    extras: 'owner_name,geo,media',
    nojsoncallback: 1
}

axios.get('https://www.flickr.com/services/rest', { params: flickParams }).then((result) => {
    {{ content | raw }}
})
