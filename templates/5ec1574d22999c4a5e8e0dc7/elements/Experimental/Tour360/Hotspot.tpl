/*
path: Hotspot.tpl
type: file
unique_id: EEjgDaMrq
icon: f:HotspotIcon.svg
helpText: interactive point within a panoramic image
sourceType: javascript
options:
  - name: type
    display: Specifies the type of action
    type: text
    options: ''
  - name: SeparatorPitch
    display: vertical tilt (pitch)
    type: separator
  - name: pitch
    display: ​Vertical Inclination Angle (Number)
    type: text
    options: ''
  - name: SeparatorYaw
    display: Horizontal camera rotation (Yaw)
    type: separator  
  - name: yaw
    display: Adjust Horizontal Rotation (Number)
    type: text
    options: ''
  - name: SeparatorText
    display: Panorama texts
    type: separator 
  - name: nameHotspot
    display: Hotspot name
    type: text
    options: ''
  - name: handleClick
    display: Fires onclick of hotspot
    type: function
*/
{% set bpr %}
import { Pannellum } from 'pannellum-react'
{% endset %}
{{ save_delayed('bpr', bpr) }}
  <Pannellum.Hotspot
    {% if element.values.type %}type={ {{element.values.type}} }{% else %}type={"custom"}{% endif %}
    {% if element.values.pitch %}pitch={ {{element.values.pitch}} }{% else %}pitch={0}{% endif %}
    yaw={ {{element.values.yaw|default("100")}} }
    {% if element.values.nameHotspot %}name={{ element.values.nameHotspot | textOrVariable }}{% endif %} 
    {% if element.values.handleClick %}
    handleClick={ (e, name) => {
        {{ element.values.handleClick }} 
    }
  }
  {% endif %} 
/>
  