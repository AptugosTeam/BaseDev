/*
path: Shadow.tpl
completePath: elements/Experimental/Shadow.tpl
type: file
unique_id: ShaumHAq
icon: file.svg
helpText: Allows you to upload multiple image files by selection or drag and drop
options:
  - name: classname
    display: ClassName
    type: text
    options: ''
  - name: containerStyle
    display: Container Style
    type: text
    options: ''
  - name: startColor
    display: Shading Color
    type: text
    options: ''
  - name: distance
    display: Shading Distance
    type: text
    options: ''
  - name: offset
    display: Shading Direction
    type: text
    options: ''
    default: "0, 0"
settings:
  - name: Packages
    value: '"react-native-shadow-2": "7.0.8",'
children: []
*/
{% set bpr %}
import { Shadow } from 'react-native-shadow-2'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<Shadow
{% if element.values.classname %}
style={ {{element.values.className}} }
{% endif %}
{% if element.values.containerStyle %}
containerStyle={ {{element.values.containerStyle}} }
{% endif %}
{% if element.values.startColor %}
startColor={{element.values.startColor | textOrVariable}}
{% endif %}
{% if element.values.distance %}
distance={ {{element.values.distance}} }
{% endif %}
{% if element.values.offset %}
offset={[ {{element.values.offset}} ]}
{% endif %}
>
{{ content | raw }}
</Shadow>