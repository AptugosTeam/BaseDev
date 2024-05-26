/*
path: Shadow.tpl
completePath: elements/Experimental/Shadow.tpl
type: file
unique_id: ShaumHAq
icon: file.svg
helpText: Allows you to upload multiple image files by selection or drag and drop
options:
  - name: className
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
  - name: paintInside
    display: Paint Inside
    type: checkbox
    options: ''
  - name: safeRender
    display: safeRender?
    type: checkbox
    options: ''
  - name: startSidesSeparator
    display: Side Properties Start
    type: separator
    options: ''
  - name: start
    display: Start Side?
    type: checkbox
    options: ''
  - name: end
    display: End Side?
    type: checkbox
    options: ''
  - name: top
    display: Top Side?
    type: checkbox
    options: ''
  - name: bottom
    display: Bottom Side?
    type: checkbox
    options: ''
  - name: endSidesSeparator
    display: Side Properties End
    type: separator
    options: ''
  - name: startSideSeparator
    display: Corner Properties Start
    type: separator
    options: ''
  - name: topStart
    display: Top Start Corner?
    type: checkbox
    options: ''
  - name: topEnd
    display: Top End Corner?
    type: checkbox
    options: ''
  - name: bottomStart
    display: Bottom Start Corner?
    type: checkbox
    options: ''
  - name: bottomEnd
    display: Bottom End Corner?
    type: checkbox
    options: ''
  - name: endCornersSeparator
    display: Corner Properties End
    type: separator
    options: ''
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
{% if element.values.className %}
style={ {{element.values.className}} }
{% endif %}
{% if element.values.containerStyle %}
containerStyle={ {{element.values.containerStyle}} }
{% endif %}
{% if element.values.safeRender %}
safeRender
{% endif %}
sides={ {
  start: {{element.values.start | default('false')}},
  end: {{element.values.end | default('false')}},
  top: {{element.values.top | default('false')}},
  bottom: {{element.values.bottom | default('false')}}
} }
corners={ {
  topStart: {{element.values.topStart | default('false')}},
  topEnd: {{element.values.topEnd | default('false')}},
  bottomStart: {{element.values.bottomStart | default('false')}},
  bottomEnd: {{element.values.bottomEnd | default('false')}}
} }
paintInside={ {{element.values.paintInside | default('false')}} }
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