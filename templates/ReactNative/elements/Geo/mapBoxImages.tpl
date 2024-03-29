/*
path: mapBoxImages.tpl
keyPath: elements/Geo/mapBoxImages.tpl
unique_id: CQ47d7H0
options:
  - name: variableToUse
    display: State Variable Name
    type: text
    options: ''
  - name: functionToUse
    display: State Function Name
    type: text
    options: ''
*/
{% set bpr %}
import { Images } from '@rnmapbox/maps'
{% endset %}
{{ save_delayed('bpr',bpr)}}
<Images
  images={ {{ element.values.variableToUse }}}
  onImageMissing={(url) => {
    {{ element.values.functionToUse }}({
      ...{{ element.values.variableToUse }},
      [url]: { uri: url },
    })
  }}
/>